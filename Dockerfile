FROM golang:1.18.3-buster

RUN go version
ENV GOPATH=/

COPY ./ ./

RUN apt-get update
RUN apt-get -y install postgresql-client

RUN chmod +x wait-for-postgres.sh

RUN go mod download
RUN go build -o music-shop ./app/cmd/main.go

CMD ["./music-shop"]
