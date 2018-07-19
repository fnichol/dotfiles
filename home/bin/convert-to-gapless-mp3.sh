#!/usr/bin/env sh

main() {
  set -eu
  if [ -n "${DEBUG:-}" ]; then set -x; fi

  if [ -z "${1:-}" ]; then
    print_help
    warn "<INPUT_FILE> argument is required"
    exit 10
  fi
  input_file="$1"
  shift
  if [ -z "${1:-}" ]; then
    print_help
    warn "<MP3_FILE> argument is required"
    exit 10
  fi
  mp3_file="$1"
  shift

  need_cmd ffmpeg
  need_cmd lame

  ffmpeg -i "$input_file" -f wav - \
    | lame --verbose --vbr-new -V 1 -b 320 --noreplaygain - "$mp3_file"
}

print_help() {
  need_cmd cat
  need_cmd basename

  local _cmd
  _cmd="$(basename "$0")"
  cat <<USAGE
$_cmd

Authors: Fletcher Nichol <fnichol@nichol.ca>

Converts an input audio file to a gapless MP3 file.

USAGE:
    $_cmd <INPUT_FILE> <MP3_FILE>

ARGS:
    INPUT_FILE    Input audio filename (ex: song.flac)
    MP3_FILE      Output MP3 filename (ex: song.mp3)

USAGE
}

need_cmd() {
  if ! command -v "$1" > /dev/null 2>&1; then
    warn "Required command '$1' not found on PATH"
    exit 127
  fi
}

warn() {
  need_cmd basename

  echo "xxx $(basename "$0"): $1" >&2
}

main "$@" || exit 99
