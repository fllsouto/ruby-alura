#encoding: utf-8

require_relative 'ui'



# Methods that deals with game running, business logic and etc.... 

def palavra_mascarada chutes, palavra_secreta
  mascara = ""

  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara << letra
    else
      mascara << "_"
    end
  end
  mascara
end

def pede_um_chute_valido chutes, erros, mascara
  cabecalho_de_tentativas chutes, erros, mascara
  loop do
    chute = pede_um_chute
    if chutes.include? chute
      avisa_chute_efetuado chutes
    else 
      return chute
    end
  end
end

def joga nome
  palavra_secreta = escolhe_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 100

  while erros < 5
    mascara = palavra_mascarada chutes, palavra_secreta
    chute = pede_um_chute_valido chutes, erros, mascara
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      total_encontrada = palavra_secreta.count chute[0]
      if total_encontrada == 0
        avisa_letra_nao_encontrado
        erros += 1
      else
        avisa_letra_encontrada total_encontrada
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        avisa_acertou_palavra
        pontos_ate_agora += 100
        break
      else
        avisa_errou_palavra
        pontos_ate_agora -= 30
        erros += 1
      end
    end
  end

  avisa_pontos pontos_ate_agora
end

def jogo_da_forca

  nome = da_boas_vindas

  loop do
    joga nome
    break if nao_quer_jogar?
  end
end