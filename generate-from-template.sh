#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
[[ ${DEBUG:-} == true ]] && set -o xtrace
readonly __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
input_file="${1:-}"

[[ -z "${input_file}" ]] && sh -c "echo \"Argument of input file required.\"; exit 1;"

set -o allexport
# shellcheck disable=SC1091
source "${__dir}/.env" 
set +o allexport

envsubst < "${input_file}"