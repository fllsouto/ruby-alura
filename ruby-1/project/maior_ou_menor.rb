# encoding: utf-8

puts "Bem vindo ao jogo da adinhação"
puts "Qual o seu nome?"
nome = gets
puts "Olá " + nome + " waka"
puts "\n"*6
puts "Começaremos o jogo para você, " + nome
puts "Escolha um número secreto entre 0 e 200..."
numero_secreto = 175
puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
puts "\n"*4

limite_de_tentativas = 5
for tentativa in 1..limite_de_tentativas  do
  puts "Tentativa " + tentativa.to_s + ".." + limite_de_tentativas.to_s
  puts "Entre com um número"
  chute = gets
  puts "Será que acertou? Seu chute foi " + chute
  acertou = chute.to_i == numero_secreto

  if acertou
    puts "Acertou!"
    break
  else
    maior = numero_secreto > chute.to_i
    if maior
      puts "Errou! O número secreto é maior que o chute"
    else
      puts "Errou! O número secreto é menor que o chute"
    end
  end
end