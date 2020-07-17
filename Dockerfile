FROM golang:1.14 AS builder

WORKDIR /server

COPY /server ./
RUN \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64 \
  GO111MODULE=on \
  go build -ldflags="-w -s" -o pwa .

FROM alpine:3.10

RUN apk add --no-cache
RUN adduser -D -g '' pwa

USER root

WORKDIR /build

ADD /server/tmpl ./tmpl
ADD /server/static ./static
COPY --from=builder /server/pwa pwa
CMD ["/build/pwa"]

USER pwa