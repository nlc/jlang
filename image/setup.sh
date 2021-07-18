original_name="$1"
original_name_base="$(echo "$original_name" | sed 's/\..*//')"
original_name_suffix="$(echo "$original_name" | sed 's/.*\.//')"
backup_name="_${original_name_base}_original.${original_name_suffix}"
ppm_name="${original_name_base}.ppm"
pgm_name="${original_name_base}.pgm"

mv "$original_name" "$backup_name"

convert "$backup_name" -compress none "$ppm_name"
convert "$backup_name" -compress none "$pgm_name"
