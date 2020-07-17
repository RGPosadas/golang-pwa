# Containerizaton Mods

## Build and Locally Run the Image
```
docker build . -t pwa:test && docker run --rm -it -p 8080:8080 pwa:test
```

## Running Latest Image
```
docker pull ritchellegmp/pwa-test
docker run --rm -it -p 8080:8080 ritchellegmp/pwa-test:latest
```

## Manually Deploying the Application
Pre-req: helm 3+
```
helm install .  --namespace pwa-test --generate-name
```