#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
[[ ${DEBUG:-} == true ]] && set -o xtrace
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

kubectl apply -f "${__dir}/namespace.yaml"
kubectl apply -f "${__dir}/rbac.yaml"

# set the namespace to be the current (default) one
kubectl config set-context --current --namespace=test-rabbitmq
# verify
kubectl config view --minify | grep namespace:

kubectl apply -f "${__dir}/rabbitmq-headless.yaml"

kubectl create secret generic erlang-cookie --from-file="${__dir}/cookie"
kubectl create secret generic rabbitmq-admin --from-file="${__dir}/user" --from-file="${__dir}/pass"

kubectl apply -f "${__dir}/configmap.yaml"
kubectl apply -f "${__dir}/statefulset.yaml"
kubectl apply -f "${__dir}/client-service.yaml"

