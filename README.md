# Pensamentos durante o processo

* Visualizando o docker-compose é possível encontrar um serviço "reids" que utiliza uma imagem chamada redis:alpine, no reader e no writer que estão na pasta services, é utilizado redis_host: "redis" no reader e redishost = "redis", no write, então o nome deve ser redis para que o dns do docker permita a conexão.
* * *
* Ainda sem sair do docker-compose, é possivel ver que os serviços web e reader utilizam uma rede chamada frontend, que não está definida, e a rede backend também não possui um driver definido. Além disso, baseando-se no README original, o serviço web se comunica com os backends e os backends comunicam-se com o banco exclusivamente, o que indica a necessidade de outra rede para comunicação com redis. Para que se tenha a mesma definição de porta HOST:CONTAINER vou utilizar o driver bridge nas redes.
* * * 
* Ao executar docker-compose up, o serviço de writer apresenta um erro, pelo docker logs, não é mostrada nenhuma informação pois o container não está em execução, mas 
ao observar o Dockerfile  do writer, o comando python abre o REPL do python não esperando por nenhum argumento, para que main.py seja executado é necessário ou usar CMD com python main.py ou ENTRYPOINT com python main.py, vou utilizar com ENTRYPOINT 
* * *
