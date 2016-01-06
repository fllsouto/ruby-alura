# encoding: utf-8

def da_boas_vindas
  puts "Bem vindo ao jogo da adinhação"
  puts "Qual o seu nome?"
  nome = gets
  puts "Olá " + nome + " waka"
  puts "\n"*6
  puts "Começaremos o jogo para você, " + nome
end

def sorteia_numero_secreto
  puts "Escolha um número secreto entre 0 e 200..."
  sorteado = 175
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  puts "\n"*4
  sorteado
end

def pede_um_numero tentativa, limite_de_tentativas
  puts "Tentativa " + tentativa.to_s + ".." + limite_de_tentativas.to_s
  puts "Entre com um número"
  chute = gets
  puts "Será que acertou? Seu chute foi " + chute
  chute.to_i
end

def verifica_se_acertou numero_secreto, chute
  acertou = chute == numero_secreto
  if acertou
    puts "Acertou!"
    return true
  end

  maior = numero_secreto > chute
  if maior
    puts "Errou! O número secreto é maior que o chute"
  else
    puts "Errou! O número secreto é menor que o chute"
  end
  false
end

da_boas_vindas
numero_secreto = sorteia_numero_secreto
limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas  do
  chute = pede_um_numero tentativa, limite_de_tentativas
  break if verifica_se_acertou numero_secreto, chute
end