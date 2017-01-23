# rordi/docker-mailcatcher

A lightweight Docker image with mailcatcher (just 64 MB compressed / 187 MB uncompressed)

You can pull the image from the [Docker registry](https://hub.docker.com/r/rordi/docker-mailcatcher/) and run with:

    docker run -d -p 1080:1080 --name mailcatcher rordi/docker-mailcatcher 

To install the image into your network with docker-compose, simply add the following lines to your docker-compose.yml and adjust the network id:

    mailcatcher:
      image: rordi/docker-mailcatcher
      container_name: mailcatcher
      ports:
        - 1080:1080
      networks:
       - yournetworkid
