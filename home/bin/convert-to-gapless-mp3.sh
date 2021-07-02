#!/usr/bin/env sh
# shellcheck shell=sh disable=SC3043

print_usage() {
  local program version author
  program="$1"
  version="$2"
  author="$3"

  need_cmd sed

  echo "$program $version

    Converts an input audio file to a gapless MP3 file.

    USAGE:
        $program [FLAGS] [--] <INPUT_FILE> <MP3_FILE>

    FLAGS:
        -h, --help      Prints help information
        -V, --version   Prints version information

    ARGS:
        INPUT_FILE    Input audio filename [ex: song.flac]
        MP3_FILE      Output MP3 filename [ex: song.mp3]

    AUTHOR:
        $author
    " | sed 's/^ \{1,4\}//g'
}

main() {
  set -eu
  if [ -n "${DEBUG:-}" ]; then set -v; fi
  if [ -n "${TRACE:-}" ]; then set -xv; fi

  need_cmd basename

  local program version author
  program="$(basename "$0")"
  version="0.5.0"
  author="Fletcher Nichol <fnichol@nichol.ca>"

  # Parse CLI arguments and set local variables
  parse_cli_args "$program" "$version" "$author" "$@"
  local input_file mp3_file
  input_file="$INPUT_FILE"
  mp3_file="$MP3_FILE"
  unset INPUT_FILE MP3_FILE

  convert "$input_file" "$mp3_file"
}

parse_cli_args() {
  local program version author
  program="$1"
  shift
  version="$1"
  shift
  author="$1"
  shift

  INPUT_FILE=""
  MP3_FILE=""

  OPTIND=1
  while getopts "hV-:" arg; do
    case "$arg" in
      h)
        print_usage "$program" "$version" "$author"
        exit 0
        ;;
      V)
        print_version "$program" "$version"
        exit 0
        ;;
      -)
        case "$OPTARG" in
          help)
            print_usage "$program" "$version" "$author"
            exit 0
            ;;
          version)
            print_version "$program" "$version"
            exit 0
            ;;
          '')
            # "--" terminates argument processing
            break
            ;;
          *)
            print_usage "$program" "$version" "$author" >&2
            die "invalid argument --$OPTARG"
            ;;
        esac
        ;;
      \?)
        print_usage "$program" "$version" "$author" >&2
        die "invalid argument"
        ;;
    esac
  done
  shift "$((OPTIND - 1))"

  if [ -z "${1:-}" ]; then
    print_usage "$program" "$version" "$author" >&2
    die "<INPUT_FILE> argument is required"
  fi
  INPUT_FILE="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_usage "$program" "$version" "$author" >&2
    die "<MP3_FILE> argument is required"
  fi
  MP3_FILE="$1"
  shift
}

convert() {
  local input_file mp3_file
  input_file="$1"
  mp3_file="$2"

  need_cmd ffmpeg
  need_cmd lame

  ffmpeg -i "$input_file" -f wav - \
    | lame --verbose --vbr-new -V 1 -b 320 --noreplaygain - "$mp3_file"
}

print_version() {
  local program version
  program="$1"
  version="$2"

  echo "$program $version"
}

need_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    die "Required command '$1' not found on PATH"
  fi
}

die() {
  echo "xxx $1" >&2
  exit 1
}

main "$@" || exit 1
