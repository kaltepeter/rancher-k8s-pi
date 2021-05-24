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

envsubst \$rancher_mgmt_ip,\$rancher_node_ip,\$network_gateway,\$dns,\$wifi_ssid,\$wifi_pw,\$rancher_mgmt_ssh_key,\$rancher_node_ssh_key < "${input_file}"