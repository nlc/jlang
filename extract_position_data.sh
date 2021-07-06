base="ks"
infile="${base}.txt"
outfile="${base}_position_data.txt"
awk '/^ *[A-Z]{2}[0-9]{4}\* .* POSITION/' "${infile}" > "${outfile}"
