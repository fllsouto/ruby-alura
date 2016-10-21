class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento)
    @titulo = titulo
    @preco = preco
    @ano_lancamento = ano_lancamento

    @preco = calcula_preco(@preco)
  end

  def calcula_preco(base)
    if @ano_lancamento < 2000
      base * 0.7
    else
      base
    end
  end

  def to_s
    puts "Título: #{titulo}"
    puts "Preço R$: #{preco}"
    puts "Ano Lançamento: #{ano_lancamento}"
  end

end

def reporta_para_newsletter livro
  return if livro.ano_lancamento > 2015

  puts livro.to_s
end

livros =[]

livros << Livro.new("Agile Web Development with Rails 3rd", 70.00, 2011)
livros << Livro.new("Agile Web Development with Rails 1rd", 70.00, 1998)
livros << Livro.new("Clean Code", 90.00, 1995)
livros << Livro.new("Continous Integration", 90.00, 1993)

livros.each do |livro|
  reporta_para_newsletter livro 
end