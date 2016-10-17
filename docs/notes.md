## Resumo

## Ruby I

###Early Return
É uma boa prática para viabilizar o entendimento de quais condições a função trata.

```ruby
def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute.to_i

  if acertou
    puts "Acertou"
    return true
  end

  .
  .
  .
end
```

###Encapsulamento
Encapsular um método consiste em extrair o comportamento de um trecho de código para uma função. Essa função pode ser utilizada por terceiros sem que aja o conhecimento do funcionamento interno dela. É importante que a função seja bem documentada ou que seu nome seja auto-explicativo(interface).

###Método
Uma função definida dentro de um escopo específico (classe) é chamado de método.

## Ruby II

### Refatoração
É importante refatorar o código para deixa-lo mais simples, alguns pontos importantes para se prestar atenção:

- Dar nomes que façam sentido para as variáveis, nunca deixe magic number ou strings pelo código
- Separar o que cada parte do código vai fazer (UI, Business logic e etc...) em arquivos diferentes
- Extrair comportamentos específicos para funções