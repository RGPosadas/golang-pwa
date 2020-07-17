# Containerizaton Mods

## Build and Locally Run the Image
docker build . -t pwa:test && docker run --rm -it -p 8080:8080 pwa:test