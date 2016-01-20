# encoding: utf-8

def da_boas_vindas
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
  puts "Qual o seu nome?"
  nome = gets.strip
  puts "\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto dificuldade
  case dificuldade
  when 1
    maximo =  30
  when 2
    maximo = 60
  when 3
    maximo = 120
  when 4
    maximo = 150
  else 
    maximo = 200
  end 
  puts "Escolha um número secreto entre 1...#{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  puts "\n"*4
  sorteado
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def pede_um_numero tentativa, limite_de_tentativas, chutes
  puts "Tentativa #{tentativa}..#{limite_de_tentativas}. Chutes até agora : #{chutes}"
  puts "Entre com um número"
  chute = gets.strip
  puts "Será que acertou? Seu chute foi : #{chute}"
  chute.to_i
end

def verifica_se_acertou numero_secreto, chute
  acertou = chute == numero_secreto
  if acertou
    ganhou
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

def joga nome, dificuldade
  numero_secreto = sorteia_numero_secreto dificuldade
  limite_de_tentativas = 5
  chutes = []
  pontos_ganhos = 1000
  for tentativa in 1..limite_de_tentativas  do
    chute = pede_um_numero tentativa, limite_de_tentativas, chutes
    chutes << chute
    pontos_perdidos = (numero_secreto - chute).abs / 2.0
    pontos_ganhos -= pontos_perdidos

    if nome.upcase == "FELLIPE"
      ganhou
      break
    end
    break if verifica_se_acertou numero_secreto, chute
  end

  puts "Número secreto era : #{numero_secreto}"
  puts "Total de pontos ganhos : #{pontos_ganhos}"
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  nao_quer_jogar = gets.strip
  nao_quer_jogar.upcase != "S"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
  joga nome, dificuldade
  break if nao_quer_jogar?
end