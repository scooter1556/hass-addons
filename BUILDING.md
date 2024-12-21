# Building add-ons from local repository

- Use builder tool to build images for all architectures

`docker run --rm --privileged -v ~/.docker:/root/.docker -v /my_addon:/data ghcr.io/home-assistant/amd64-builder --all -t /data`
