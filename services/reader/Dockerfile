FROM golang:1.16
WORKDIR /go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go
ADD . /go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go

RUN go mod init reader
RUN go mod tidy

EXPOSE 8080
CMD ["go","run","main.go"]
