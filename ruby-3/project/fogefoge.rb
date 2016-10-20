require_relative 'ui'
require 'pry'

def le_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
  caracter_do_heroi = "H"
  mapa.each_with_index do |linha_atual, linha|
    coluna_do_heroi = linha_atual.index caracter_do_heroi
    if coluna_do_heroi != nil
      # binding.pry
      return [linha, coluna_do_heroi]
    end
  end
  nil
end

def calcula_nova_posicao heroi, direcao
  heroi = heroi.dup
  movimentos = {
    "W" => [-1, 0],
    "S" => [+1, 0],
    "A" => [0, -1],
    "D" => [0, +1]
  }

  movimento = movimentos[direcao]
  heroi[0] += movimento[0]
  heroi[1] += movimento[1]
  heroi
end

def posicao_valida? mapa, posicao
  linhas = mapa.size
  colunas = mapa[0].size
  estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
  estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

  if estourou_linhas || estourou_colunas
    return false
  end

  valor_atual = mapa[posicao[0]][posicao[1]]
  if valor_atual == "X" || valor_atual == "F"
    return false
  end

  true
end

def soma_vetor vetor1, vetor2
  [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicoes_validas_a_partir_de mapa, novo_mapa, posicao
  posicoes = []
  movimentos = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  movimentos.each do |movimento|
    nova_posicao = soma_vetor(posicao, movimento)
    if posicao_valida?(mapa, nova_posicao) && posicao_valida?(novo_mapa, nova_posicao)
      posicoes << movimento
    end
  end
  # binding.pry
  posicoes
end

def copia_mapa mapa
  mapa.join("\n").tr("F", " ").split "\n"
end

def move_fantasma mapa, novo_mapa, linha, coluna
  posicoes = posicoes_validas_a_partir_de mapa, novo_mapa, [linha, coluna]
  return if posicoes.empty? #clause guard, early return

  aleatoria = rand posicoes.size
  posicao = posicoes[aleatoria]
  # binding.pry
  mapa[linha][coluna] = " "
  novo_mapa[linha + posicao[0]][coluna + posicao[1]] = "F"
end

def move_fantasmas mapa
  caracter_do_fantasma = "F"
  novo_mapa = copia_mapa mapa
  mapa.each_with_index do |linha_atual, linha|
    #Duck typing to turn string to array and use each_with_index method
    linha_atual.chars.each_with_index do |caracter_atual, coluna|
      eh_fantasma = caracter_atual == caracter_do_fantasma

      if eh_fantasma
        move_fantasma mapa, novo_mapa, linha, coluna
      end
    end
  end
  novo_mapa
end

def jogador_perdeu? mapa
  !encontra_jogador mapa
end

def joga(nome)
  mapa = le_mapa 2

  while true
    desenha mapa
    direcao = pede_movimento
    heroi = encontra_jogador mapa
    nova_posicao = calcula_nova_posicao heroi, direcao

    if !posicao_valida? mapa, nova_posicao
      next
    end

    mapa[heroi[0]][heroi[1]] = " "
    mapa[nova_posicao[0]][nova_posicao[1]] = "H"

    mapa = move_fantasmas mapa

    if jogador_perdeu?
      game_over
      break
    end
  end
end

def inicia_fogefoge
  nome = da_boas_vindas
  joga nome
end