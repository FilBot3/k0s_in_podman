#!/usr/bin/env bash

# We need to get a Worker Token to allow us to spin up a new worker instance
# and join the cluster.
token=$(sudo podman exec -t -i k0s k0s token create --role=worker)

# Create a "Named Volume` for our k0s Worker container.
sudo podman volume create k0s-worker1

# Run/Pull k0s so that it can be ran as a Worker and join the cluster. We need
# expose either the selected ports you're using to connect to your app with or
# --publish-all or --network=host. The network option has not been tested.
# We also need to mount the cgroups stuff and namespace settings like we did
# for the k0s Controller.
sudo podman run \
  --detach \
  --name k0s-worker1 \
  --hostname k0s-worker1 \
  --privileged \
  --volume k0s-worker1:/var/lib/k0s \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:rw \
  --cgroupns=host \
  --publish 31234:31234 \
  docker.io/k0sproject/k0s:latest \
    k0s worker $token
