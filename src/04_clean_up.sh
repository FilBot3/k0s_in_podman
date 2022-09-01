#!/usr/bin/env bash

sudo podman container stop k0s
sudo podman container stop k0s-worker1

sudo podman container rm k0s
sudo podman container rm k0s-worker1

sudo podman volume rm k0s-controller
sudo podman volume rm k0s-worker1

sudo podman network rm k0s-net
