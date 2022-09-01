#!/usr/bin/env bash

sudo podman exec k0s cat /var/lib/k0s/pki/admin.conf > k0s.kubeconfig.yaml

kubectl --kubeconfig=./k0s.kubeconfig.yaml apply -f ./src/kube_manifests/

