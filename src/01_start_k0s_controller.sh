#!/usr/bin/bash

# Create a Podman Volume.
# The k0s Docker documentation uses an anonymous volume. While that works in
# Podman, I do not like that, so I create a named one. Makes it easier to clean
# up later as well.
sudo podman volume create k0s-controller

# Run/Pull k0s latest from Docker Hub. We also need to run this as sudo because
# there are some things that the container has to do. That's why it also needs
# the --privileged flag as well as mounting the cgroup folder and cgroupns=host
sudo podman run \
  --detach \
  --name k0s \
  --hostname k0s \
  --privileged \
  --volume k0s-controller:/var/lib/k0s \
  --cgroupns=host \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:rw \
  --publish 6443:6443 \
  docker.io/k0sproject/k0s:latest
