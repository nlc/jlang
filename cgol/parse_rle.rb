#!/bin/ruby

require 'optparse'

OPTIONS = {}
OptionParser.new do |opts|
  opts.on('-b', '--binary', 'Output as a J-style binary array') do |b|
    OPTIONS[:binary] = b
  end

  opts.on('-p', '--plaintext', 'Output in plaintext format') do |p|
    OPTIONS[:plaintext] = p
  end

  opts.on('-cCHARS', '--chars=CHARS', 'Charset to use for output') do |c|
    OPTIONS[:chars] = c
  end
end.parse!

class Rle
  attr_accessor :bounds, :orig_str, :cells, :name, :metadata

  def parse(rle_str)
    @orig_str = rle_str

    metadata_lines, data_lines =
      @orig_str.split(/\n/).partition do |line|
        line =~ /^ *#/
      end

    @metadata = {}
    metadata_lines.each do |line|
      key, rest = line.match(/^ *#([CcNOPRr]) *(.*)/).to_a[1..]

      key.upcase! if key == 'c'

      @metadata[key] = [] if @metadata[key].nil?
      @metadata[key] << rest
    end

    # @name = metadata_lines.first { |line| line =~ /^ *#N/ }.match(/^ *#N *(.*) *$/).to_a[1] || '?'

    header_line = data_lines.shift
    raise "Header line pattern not recognized (#{header_line.inspect})" unless header_line.gsub(/ /, '') =~ /^x=\d+,y=\d+(,rule=.+)?$/i

    input_width = header_line.match(/x *= *(\d+)/).to_a[1].to_i
    input_height = header_line.match(/y *= *(\d+)/).to_a[1].to_i

    @bounds = [input_width, input_height]

    @cells =
      data_lines.join.gsub(/!$/, '').split(/\$/).map do |row|
        row.scan(/(\d+)?([bo])/).map do |n, c|
            c * (n || '1').to_i
        end.join.ljust(width, 'b')
      end.map do |row|
        row.chars.map do |char|
          {'b' => 0, 'o' => 1}[char]
        end
      end
  end

  def initialize(rle_str)
    parse(rle_str)
  end

  def name
    @metadata['N']&.first || ''
  end

  def author
    @metadata['O']&.first || ''
  end

  def comments
    @metadata['C'] || []
  end

  def width
    @bounds[0]
  end

  def width=(new_width)
    @bounds[0] = new_width
  end

  def height
    @bounds[0]
  end

  def height=(new_height)
    @bounds[0] = new_height
  end

  def to_s(charset: ' #')
    @cells.map do |row|
      row.map do |cell|
        charset[cell]
      end.join
    end.join("\n")
  end

  def to_j_array
    @cells.map do |row|
      row.join(' ')
    end.join("\n")
  end
end

rle = Rle.new(STDIN.read)

if OPTIONS[:binary].nil?
  if OPTIONS[:plaintext]
    puts "! #{rle.name}"
    puts "! By #{rle.author}" unless rle.author.nil?
    rle.comments.each do |comment|
      puts "! #{comment}"
    end
    puts '!'
    puts rle.to_s(charset: '.O')
  elsif OPTIONS[:chars].nil?
    puts rle
  else
    puts rle.to_s(charset: OPTIONS[:chars])
  end
else
  puts rle.to_j_array
end
