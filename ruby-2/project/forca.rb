#encoding: utf-8

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

def pede_um_chute chutes, erros
  puts "\n"*4
  puts "Erros até agora: #{erros}"
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip
  puts "Será que acertou? Seu chute foi: #{chute}"
  chute
end

def joga nome
  palavra_secreta = escolhe_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 100

  while erros < 5
    puts "Chutes até agora: #{chutes}"
    chute = pede_um_chute chutes, erros

    if chutes.include? chute
      puts "Essa letra já foi chutada, tente de novo!"
      next
    end
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      total_encontrada = palavra_secreta.count chute[0]
      if total_encontrada == 0
        puts "A letra chutada não na palavra sorteada"
        erros += 1
      else
        puts "A letra chutada aparece #{total_encontrada} vezes na palavra sorteada"
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        puts "Parabéns, você acertou a palavra"
        pontos_ate_agora += 100
        break
      else
        puts "Que pena, você errou a palavra"
        pontos_ate_agora -= 30
        erros += 1
      end
    end
  end

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = da_boas_vindas

loop do
  joga nome
  break if nao_quer_jogar?
end