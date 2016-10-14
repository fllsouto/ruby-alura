#encoding: utf-8

# Method to interact with the user (I/O)
def avisa_chute_efetuado(chutes)
  puts "Chutes até agora: #{chutes}"
end

def avisa_letra_nao_encontrada
  puts "A letra chutada não na palavra sorteada"
end

def avisa_letra_encontrada total_encontrada
  puts "A letra chutada aparece #{total_encontrada} vezes na palavra sorteada"
end

def avisa_acertou_palavra
  puts "Parabéns, você acertou a palavra"
end

def avisa_errou_palavra
  puts "Que pena, você errou a palavra"
end

def avisa_pontos pontos_ate_agora
  puts "Você ganhou #{pontos_ate_agora} pontos."
end


def da_boas_vindas
  puts "Bem vindo ao jogo da Forca"
  puts "Qual o seu nome?"
  nome = gets.strip
  puts "\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def escolhe_palavra_secreta
  puts "Escolhendo uma palavra secreta"
  palavra_secreta = "programador"
  puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
  palavra_secreta
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  nao_quer_jogar = gets.strip
  nao_quer_jogar.upcase != "S" 
end

def cabecalho_de_tentativas chutes, erros, mascara
  puts "\n"*4
  puts "Palavra Secreta: #{mascara}"
  puts "Erros até agora: #{erros}"
  puts "Entre com uma letra ou uma palavra"
end


def pede_um_chute
  chute = gets.strip
  puts "Será que acertou? Seu chute foi: #{chute}"
  chute
end