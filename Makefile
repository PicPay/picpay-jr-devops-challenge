.PHONY: all up down

all: up

up:
	cd services/reader && \
	go mod init github.com/PicPay/picpay-jr-devops-challenge/services/go && \
	go get ./... && \
	docker-compose up -d --build

down:
	cd services/reader && \
	rm -f go.mod go.sum && \
	docker-compose down