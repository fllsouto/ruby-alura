class BagOfWords
  attr_reader :words
  def initialize
    @words  = []
  end

  def put(*words)
    @words += words
  end

  def empty?
    @words.size == 0
  end

  def has_words?
    @words.size > 0
  end

  def bag_of_words?
    self.class.name == "BagOfWords"
  end

end