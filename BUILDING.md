# Building add-ons from local repository

 - Enable cross-compilation

`docker run --rm --privileged multiarch/qemu-user-static --reset -p yes`

 - Use builder tool to build images for all architectures

`docker run --rm --privileged -v ~/.docker:/root/.docker -v /my_addon:/data homeassistant/amd64-builder --all -t /data`
