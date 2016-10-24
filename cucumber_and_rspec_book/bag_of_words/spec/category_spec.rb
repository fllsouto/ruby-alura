require "spec_helper"
require "category"
require 'rspec/collection_matchers'

describe Category do
  it "contains all the products of its subcategories" do
    eletronics = Category.new("eletronics")
    computers = Subcategory.new("computers")
    cell_phone = Subcategory.new("cell phones")
    computers.add_product("MacBook")
    cell_phone.add_product("iPhone")

    eletronics.add_subcategories(computers, cell_phone)

    # eletronic_products = eletronics.subcategories.map{ |sub|
    #   sub.products
    # }

    # eletronic_products.flatten!

    # It's not so obvious what is the objective of the test, and the error message isn't good

    # expect(eletronic_products).to include("MacBook", "iPhone")

    expect(eletronics).to contain_products("MacBook", "iPhone", "Galaxy S6")
  end
  
  it "is true that 21 is multiple of 7" do
    expect(21).to be_a_multiple_of(7)
  end

end

RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    (actual % expected) == 0
  end
end

RSpec::Matchers.define :contain_products do |*products|
  match do |category|
    subcategories_products = category.subcategories.map{ |sub|
      sub.products
    }

    subcategories_products.flatten!

    expect(subcategories_products & products).to eq products    
  end

  failure_message do |category|
   "expected category #{category.name} to contaion products #{products}" 
  end
end