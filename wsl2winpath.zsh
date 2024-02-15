
convert_and_copy(){
  local abs_path=$(realpath $1)
  local win_path=$(echo "$abs_path" | sed "s|/mnt/||" | sed "s|/|:|1")
  win_path=$(echo "$win_path" | tr '/' '\\\\')

  win_path=$(echo "$win_path" | sed "s|^\(.\):|\\U\1:\\\\|")
  echo -n "\"$win_path\"" | clip.exe

  echo "\"$win_path\" copied to clipboard."
}

path=${1:-$(pwd)}
convert_and_copy "$path"
