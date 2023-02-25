# Pensamentos durante o processo

* Visualizando o docker-compose é possível encontrar um serviço "reids" que utiliza uma imagem chamada redis:alpine, no reader e no writer que estão na pasta services, é utilizado redis_host: "redis" no reader e redishost = "redis", no write, então o nome deve ser redis para que o dns do docker permita a conexão.
* * *
* Ainda sem sair do docker-compose, é possivel ver que os serviços web e reader utilizam uma rede chamada frontend, que não está definida, e a rede backend também não possui um driver definido. Além disso, baseando-se no README original, o serviço web se comunica com os backends e os backends comunicam-se com o banco exclusivamente, o que indica a necessidade de outra rede para comunicação com redis. Para que se tenha a mesma definição de porta HOST:CONTAINER vou utilizar o driver bridge nas redes.
* * * 
* Ao executar docker-compose up, o serviço de writer apresenta um erro, pelo docker logs, não é mostrada nenhuma informação pois o container não está em execução, mas 
ao observar o Dockerfile  do writer, o comando python abre o REPL do python não esperando por nenhum argumento, para que main.py seja executado é necessário ou usar CMD com python main.py ou ENTRYPOINT com python main.py, vou utilizar com ENTRYPOINT 
* * *
* Após a mudança no ENTRYPOINT do writer o mesmo ainda apresenta erro na criação do container, neste caso um erro de dependencia, não foi instalado o modulo redis, para resolver isso vou adicionar pip install redis, no Dockerfile do writer.
* * * 
* Depois da dependencia do redis ter sido, instalada, o writer está rodando, o que foi checado utilizando do comando "docker ps", no entanto o reader, não está executando, ao checar os logs do reader, é apresentado um erro "go.mod not found", para resolver este problema vou adicionar "go mod init", no Dockerfile do reader
* * * 
* Ao executar o reader, uma vez que o modulo foi iniciado, este apresenta um erro de duas dependencias, redis e cors,  a mensagem de erro diz como instala-las, 
vou adicionar estes "go get ..." no Dockerfile do reader
* * * 
* Depois de instalar cors e redis no reader, é apresentado um erro de código informando que foram passados dois argumentos onde somente um era necessário, é mostrado que isso ocorre na linha 27, no método client.cmdable.Get, onde são passados um context.Context como primeiro argumento e uma string como segundo argumento e que só é necessário o argumento string, vou remover o primeiro argumento do código.
* * * 
* Agora que o código do reader foi alterado, todos os serviços estão executando, vou obter os logs de cada um e analisar. Nem o writer nem o reader possuem logs, os logs do redis dizem que ele está pronto para receber conexões e o do serviço web diz, que ele está executando na porta 3000, acredito que no docker-compose não tinha a porta 3000 ... . Não no docker-compose o serviço web é declarado na porta 5000, como está o Dockerfile ? Tem um Expose 5000 ... Neste caso, vou alterar o EXPOSE para o valor correto no Dockerfile e o serviço web para ser na porta 3000:3000, para seguir o padrão da mesma porta no host e no container. 
* * *
* Com a modificação sobre a porta do serviço web, e os serivços rodando, vou acessar a aplicação e ver seu funcionamento ... Ao abrir no localhost:3000, encontro que os serviçoes writer e reader estão down ... Acessando o app.js vejo que o reader é na porta 8080, e o writer na porta 8081, no dockerfile do reader é exposta a porta 8080 e no dockerfile do writer é exposta a porta 8081, porém no docker-compose estas estão trocadas, o reader com a porta 8081 e o writer com a porta 8080, vou fazer a alteração para bater com as portas que forma expostas.
* * *
* Agora que as portas foram corrigidas, o frontend indica que o reader e o writer estão up, ao mesmo tempo ao clicar em enviar no writer este faz uma requisição, e no reader é preciso recarregar a página para que o conteúdo seja mostrado, vou parar o container do redis, para checar se realmente está sendo feito o uso dele... Ao parar o redis, e fazer uma submissão no writer, o conteúdo do reader fica vazio, ao reiniciar o redis o último valor antes da interrupção deste é mostrado, ao enviar outra coisa no writer e recarregar a pagina do reader o novo valor é inserido, o que significa que a comunição com o redis está funcionando.
* * * 
