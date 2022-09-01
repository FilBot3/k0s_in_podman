# Setup k0s in Podman Containers

## Overview

I don't use Docker, so when I see people telling you to run things in Docker, I
immediately try to run them in Podman. So, the following is how I run k0s in
Podman instead of Docker.

I have noticed that you cannot "restart" the cluster once you turn it off/stop
the containers or replace the containers. It's easier to delete/clean up
everything and start over. So, **do not use this to run production loads**. Once
I figure out how to necromance this, then I'll change my opinion.

## Extras

You may want to run Podman as `sudo podman` without being prompted for your
credentials all the time. If you're on Linux with `sudo` installed, do this:

```bash
sudo visudo -f /etc/sudoers.d/$(whoami)
```

Then the contents would be similar to this. Replace filbot for your username.

```bash
filbot ALL=(ALL) NOPASSWD: /usr/bin/podman
```

## Running on Ubuntu or Debian

If you're running this on Ubuntu 2202 or the latest Debian, then you'll want to
run these commands as well.

```bash
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```

I find that you'll need to reset your Podman as well.

```bash
sudo podman system reset --force
```

You may need to clean up any Volumes or Networks that are left over.
