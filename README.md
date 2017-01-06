# Bolsa de Emprego Rails

Bolsa de Emprego - Initial  @ Wiremaze.

## Licença

Todo o código presente em [Bolsa de Emprego]()
está disponível sob as Licenças MIT e Beerware. Ver
[LICENSE.md](LICENSE.md) para mais details.

## Como começar

Para começar a aplicação, faça clone do repositório e depois install as gems necessárias_

```
$ bundle install --without production
```

Depois, faça migrate à base de dados:

```
$ rails db:migrate
```

Finalmente, execute o conjunto de testes para verifcar que tudo está com o funcionamento correcto:

```
$ rails test
```

Se os testes forem positivos, deverá estar pronto a correr a app num servidor local:

```
$ rails server
```
