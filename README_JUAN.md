# Docker Compose
- Nome "redis" estava errado
- Adicionar a network ```frontend```
- Resolver network dos serviços
- Aadicionar ```hostname``` e ```container_name```
- Resolver portas iguais pelos containers
- Adicionar ```depends_on``` para assegurar o funcionamento das aplicações

# Frontend
- Dockerfile - Adicionar ```ADD . /app```

# Writer
- Dockerfile - Instalar dependencia do redis ```RUN pip install redis```
- Dockerfile - Trocar comando inicial ```CMD [ "python", "./main.py" ]```

# Reader
- Gerar os requisitos com ```go mod init``` e ```go get ./...``` (feito automaticamente com o Makefile)
- Dockerfile - Instalar modulos ```RUN go mod download```
- Dockerfile - Gerar o executavel ```RUN go build -o main .```
- Dockerfile - Executar o arquivo gerado ```CMD ["/go/src/github.com/PicPay/picpay-jr-devops-challenge/services/go/main"]```

## Reader -Aplicação - Erro ao pegar o valor no Redis, resolvido com ajustes no código:
```
key, err := client.Get("SHAREDKEY").Result()
if err != nil {
    panic(err)
}
fmt.Fprintf(writer, key)
```

# Usage
- Subir os serviços ```make up```
- Matar os serviços ```make down```

# Chart
![Organograma](https://i.imgur.com/kPxydAv.png "Organograma")