# Pensamentos durante o processo

* Visualizando o docker-compose é possível encontrar um serviço "reids" que utiliza uma imagem chamada redis:alpine, no reader e no writer que estão na pasta services, é utilizado redis_host: "redis" no reader e redishost = "redis", no write, então o nome deve ser redis para que o dns do docker permita a conexão.
* * *
