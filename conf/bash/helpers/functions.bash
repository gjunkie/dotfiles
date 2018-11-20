
# utility functions
_is_empty() {
  local var=$1
  [[ -z $var ]]
}
_is_not_empty() {
  local var=$1
  [[ -n $var ]]
}
_exists() {
  local var=$1
  [[ -e $var ]]
}
_is_file() {
  local file=$1
  [[ -f $file ]]
}
_is_dir() {
  local dir=$1
  [[ -d $dir ]]
}
_print_error() {
  local message=$1
  printf "%s⊘ Error:%s %s. Aborting!\n\n" "$(tput setaf 1)" "$(tput sgr0)" "$message"
}
_print_success() {
  local message=$1
  printf "%s✓ Success:%s\n" "$(tput setaf 2)" "$(tput sgr0) $message"
}

# options
cmdline() {
    # got this idea from here:
    # http://kirk.webfinish.com/2009/10/bash-shell-script-to-use-getopts-with-gnu-style-long-positional-parameters/
    local arg=
    for arg
    do
        local delim=""
        case "$arg" in
            #translate --gnu-long-options to -g (short options)
            --edit)         args="${args}-e ";;
            --help)         args="${args}-h ";;
            --prefix)       args="${args}-p ";;
            --test)         args="${args}-t ";;
            --version)      args="${args}-v ";;
            #pass through anything else
            *) [[ "${arg:0:1}" == "-" ]] || delim="\""
                args="${args}${delim}${arg}${delim} ";;
        esac
    done

    #Reset the positional parameters to the short options
    eval set -- "$args"

    while getopts ":ehptv" OPTION
    do
        case $OPTION in
            e)
                _edit
                exit 0
                ;;
            h)
                _print_help
                exit 0
                ;;
            p)
                _print_directory
                exit 0
                ;;
            t)
                _run_tests
                exit 0
                ;;
            v)
                _version
                exit 0
                ;;
            \?)
                _is_not_valid_option "-$OPTARG"
                usage
                exit 1
                ;;
        esac
    done

    return 0
}

# program functions
_error_out() {
    _print_error "No $PROGDIR found!"
    printf 'Run the installer <%shttps://github.com/chrisopedia/dotfiles#how-to-install%s>\n' "$(tput smul)" "$(tput rmul)"
    exit 1
}
_require_prog() {
  local prog=$1
  local msg=$2
  local url=$3
  type -P "$prog" >/dev/null || {
    print_error "$msg"
    echo "Download it at $url"
    exit 2
  }
}
