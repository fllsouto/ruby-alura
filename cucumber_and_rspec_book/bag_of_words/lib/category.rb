class Category
  attr_reader :subcategories
  attr_reader :name

  def initialize(name)
    @name = name
    @subcategories = []
  end

  def add_subcategories(*subcategories)
    @subcategories += subcategories
  end
end

class Subcategory
  attr_reader :products

  def initialize(name)
    @name = name
    @products = []
  end

  def add_product(product)
    @products << product
  end
end