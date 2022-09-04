## Changelog

As alterações realizadas visam corrigir a estrutura do projeto, assim como definir uma arquitetura para o sistema. 

- `web` conecta-se com `reader` e `writer` pela rede `frontend`, não havendo conexão com o armazenamento (`redis`).

- O back end, composto pelos serviços `reader` e `writer` se comunicam diretamente com o armazenamento (`redis`) para trocar informações.

### root

- Adicionado Makefile para subir e descer containers com `docker-compose`.

- Adicionado CHANGELOG.md para visualizar alterações feitas no código.

### docker-compose.yaml

- Adicionada rede `frontend`.

- Corrigido nome do serviço `redis`.

- Alterado porta para serviço `web` de 5000 para 5001.

- Corrigindo as portas dos serviços `reader` e `writer`.

- Adicionando a porta utilizada no `redis`.

- Adicionado `volumes` em todos os containers para facilitar desenvolvimento.

- Adicionando `depends_on` para seguir um fluxo dependência na subida de containers.

### services/frontend

- Corrigindo `Dockerfile`.

### services/reader

- Corrigindo `Dockerfile`.

- Adicionando arquivos `go.mod` e `go.sum` com as dependencias do projeto.

- Corrigindo endpoint `/data` onde o `client.Get` passava parametros excedentes. Era necessário passar somente uma string que seria a key: `key := client.Get("SHAREDKEY")`.

### services/writer

- Corrigindo `Dockerfile`.

- Adicionando `requirements.txt`.