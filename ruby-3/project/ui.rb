def da_boas_vindas
  puts "Bem vindo ao Foge-foge"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n"*5
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def desenha mapa
  puts mapa
end

def pede_movimento
  puts "Para onde desenha ir?"
  movimento = gets.strip
end