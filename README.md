# rordi/docker-mailcatcher

A lightweight Docker image with [mailcatcher](https://mailcatcher.me/) (just 64 MB compressed / 187 MB uncompressed).

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

Finally, confiugure your application to use the Mailcatcher SMTP on port 1025, e.g. host: mailcatcher:1025. You can access the catched emails on the web GUI via http://localhost:1080. 

Please refer to the [mailcatcher website](https://mailcatcher.me/) for more information.
