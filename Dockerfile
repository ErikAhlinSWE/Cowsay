FROM golang:alpine AS builder
# Installera GO
# kompilera vår kod -> EXE-fil
# kör EXE-fil

RUN apk update && apk aa --no-cache git
WORKDIR $GOPATH/scr/mypackage/myappp/
COPY . .

RUN go get -d -v

RUN go build -o /app/cmd/cowsay
FROM scratch

COPY --from=builder /app/cmd/cowsay /cowsay
COPY *.yaml ./

EXPOSE 8080

ENTRYPOINT [ "/cowsay" ]
# Körs när containern kickar igång



