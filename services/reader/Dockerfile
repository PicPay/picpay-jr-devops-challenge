FROM golang:1.16
WORKDIR /go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go
ADD . /go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go
RUN go mod download
RUN go build -o main .
EXPOSE 8080
CMD ["/go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go/main"]