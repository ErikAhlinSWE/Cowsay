FROM golang:1.23.2-alpine
# Installera GO
# kompilera vår kod -> EXE-fil
# kör EXE-fil

COPY . .
RUN go get -d -v
RUN go build -o /app/cmd/cowsay
#

ENTRYPOINT [ "/app/cmd/cowsay" ]
# Körs när containern kickar igång



