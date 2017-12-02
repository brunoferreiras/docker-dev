# Templates para ambientes de desenvolvimento utilizando Docker
Os arquivos estão modelados com base no projeto [Ambientum](https://github.com/codecasts/ambientum)

# Como utilizar
Na pasta raiz da sua aplicação, copie e cole o arquivo docker-compose.yml do seu respectivo ambiente, que você deseja montar.

Lembre-se de deixar as variáveis de ambiente do <b>docker-compose.yml</b> iguais ao do <b>.env</b> da sua aplicação.

### Substituindo comandos locais:
Umas das funcionaliades do Ambientum é permitir a utilização de comandos relacionados a PHP e NODE.JS dentro de
containers.

Existem alguns aliases que precisam ser setados, os comandos abaixo lhe mostram como os ativar:

#### Para usuários Bash and ZSH:
```
curl -L https://github.com/codecasts/ambientum/raw/master/commands.bash -o ~/.ambientum_rc
source ~/.ambientum_rc
```
#### Para usuários Windows (via Git Bash):
```
curl https://github.com/codecasts/ambientum/raw/master/commands.git-bash -o ~/.ambientum_rc
source ~/.ambientum_rc
```
# Para finalizar
Execute um <b>docker-compose up -d</b> e seja feliz!

Para mais informações, consulte a documentação do [Ambientum](https://github.com/codecasts/ambientum) :)
