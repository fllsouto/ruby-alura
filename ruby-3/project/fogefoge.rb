require_relative 'ui'

def le_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
  for linha = 0..(mapa.size - 1)
    if mapa[linha].include? "H"
      for colunha = 0..(linha.size - 1)
        if mapa[linha][colunha] == "H"
        end
      end
    end
  end
end

def joga(nome)
  mapa = le_mapa 1

  while true
    desenha mapa
    direcao = pede_movimento
  end
end

def inicia_fogefoge
  nome = da_boas_vindas
  joga nome
end