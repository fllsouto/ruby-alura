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

### Ruby III

```ruby
foo = [6,5,4,3,2,1]

#Passing a "block" to each_with_index function 
foo.each_with_index do |elemento, index|
  puts "#{elemento} --- #{index}"
end

6 --- 0
5 --- 1
4 --- 2
3 --- 3
2 --- 4
1 --- 5
```
Devemos evitar de começar a refatorar um código antes de assegurar que ele está funcionando.


#### Duck Typing
Duck Typing é útil por que podemos tratar objetos apenas pelo comportamento deles, sem nos preocuparmos com os tipos. Pode ser perigoso caso o comportamento seja diferente do que esperamos, por exemplo, se o resultado não for do tipo esperado.

Os métodos size, [] e each são próprios de Array, mas posso utiliza-lo com uma string considerando que ele é um Array. Porém se eu tiver um método específico como o "each_wih_index" pode ser que as strings não saibam como lidar com esse tipo de comportamento. Esse tipo de erro irá só ocorrer em tempo de execução, portante o desenvolvedor, mesmo que use duck typing, tem que se preocupar com a tipagem do dado.

#### Orientação a Objeto
No nosso código existe muito vazamento de implementação, sabemos que um mapa é um array de string, um herói é um vetor de duas posições, um fantasmas é... Isso não é muito bom, cada elemento tem que guardar dentro de si suas estruturas e não expor elas.

#### Feature Envy
Feature envy é um code smell quando um trecho de código realiza certas instruções que deveriam ser de responsabilidade de um objeto específico, por exemplo:

```ruby
#fogefoge.rb

def calcula_nova_posicao heroi, direcao
  heroi = heroi.dup
  movimentos = {
    "W" => [-1, 0],
    "S" => [+1, 0],
    "A" => [0, -1],
    "D" => [0, +1]
  }

  movimento = movimentos[direcao]
  heroi.linha += movimento[0]
  heroi.coluna += movimento[1]
  heroi
end 

```
O das 6 linhas do método acim, 4 delas estão manipulando diretamente o herói, isso é um indicativo de feature envy, o **fogefoge.rb** está roubando funcionalidades que deveriam estar implementadas no **heroi.rb**


#### Attr_accessor e @variable

```ruby
class Foo

  attr_accessor :nome, :sobrenome, :idade, :gender

  #def nome
  #  return (gender == "M") "Mister " + @nome : "Miss " + @nome
  # end

  # É diferente chamar nome e @nome, no primeiro usamos o getter que é criado automaticamente, e que pode ser reimplementado como fiz acima, no segundo estamos usando 
  # diretamente o valor da variável 

```

- attr_reader: Apenas leitura
- attr_writer: Apenas escrita
- attr_accessor: Ambos

#### Funções e métodos
Funções são blocos de código que possuem diversas instruções que precisam ser chamadas, e métodos são funções dentro de objetos. Essa definição pode ser muito mais refinada do que isso. Em ruby não podemos considerar funções como valores, como por exemplo:

```ruby
def bemvindo nome
  puts "Bem vindo #{nome}"
end

# Isso não é permitido!
minha_funcao = bemvindo
minha_funcao "Fellipe"

# O jeito correto de fazer é

# O nome disso é labmda literal (Proc)
bemvindo = -> (nome) {
  puts "Bem vindo #{nome}"
}

bemvindo.call "Fellipe"
```