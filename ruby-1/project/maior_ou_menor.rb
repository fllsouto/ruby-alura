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
  puts "Tentativa 1"
  puts "Entre com um número"
  chute = gets
  puts "Será que acertou? Seu chute foi " + chute
  puts chute.to_i == numero_secreto