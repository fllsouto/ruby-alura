# Methods that deals with I/O rank data

def le_rank
  conteudo = File.read("rank.txt")
  conteudo.split("\n")
end

def salva_rank nome, pontos_totais
  conteudo = "#{nome}\n #{pontos_totais}"
  File.write("rank.txt", conteudo)
end