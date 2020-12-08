FROM golang:buster

ENV GOBIN=$GOPATH/bin
ENV PATH=$PATH:$GOBIN

RUN apt update && apt upgrade -y
RUN mkdir /app
ADD . /app
WORKDIR /app

RUN go get
RUN go build -o main .

EXPOSE 9000
CMD ["/app/main"]
