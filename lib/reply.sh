# Send a <color> error message and return 1 / [code] : 1721421080

## aptly named because this was also breaking shell: TODO more testing required
function breaker() {
  [[ $# == 2 ]] && code=$2 || code=1
  echo -e "\033[38;5;160m$1\033[0m"
  return "$2" &>/dev/null \; exit "$2"
}

function reply() {
  declare color
  kind=$1
  word=$2
  [[ $# == 3 ]] && code=$3 || code=3
  case $kind in
    -e|--error)
        breaker "$word" "$code"
      ;;
    -w|--warn)
        code=0
        color='\033[0;33m'
        memo="WARN: $word"
      ;;
    -i|--info)
        code=0
        color='\033[1;36m'
        memo="INFO: $word"
      ;;
    -c|--clear)
        code=0
        color='\e[1A\e[0K\033[1;36m'
        memo="INFO: $word"
      ;;
    *)
        code=0
        color='\033[1;36m'
        memo="INFO: $kind"
      ;;
  esac

  msg="$color${memo[@]}\033[0m"
  echo -e "$msg" && return $code
}

alias clr='reply -c'
alias err='reply -e'
alias nfo='reply -i'
alias wrn='reply -w'
