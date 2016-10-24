require "spec_helper"
require "bag_of_words"
require 'rspec/collection_matchers'

describe BagOfWords do
  after(:all) do
    # Teardown
  end

  it "is possible to put words on it " do
    # Setup
    bag = BagOfWords.new

    # Exercise
    bag.put("hello", "world")

    # Sequence of steps:
    #
    # 1 - Teste if Bag of words is a collection or if It has a collection
    #
    # 2 - Verify if the object respond to this method
    #
    # 3 - If the object responds the HaveMatcher assumes that the object has a collection

    # Verify
    expect(bag).to have(2).words
  end

  it "is possible to have a empty bag" do
    bag = BagOfWords.new

    expect(bag).to be_empty
  end

  it "is possible to have a not empty bag" do
    bag = BagOfWords.new

    bag.put("hello")

    expect(bag).not_to be_empty # creates a predicate method be_method_name?
  end

  it "is possible to verify if the bag is empty" do
    bag = BagOfWords.new
    
    bag.put("hello")

    expect(bag).to have_words  # creates a predicate method has_method_name? using have_method_name?
  end

  it "is possible to verify if the bag is a bag of words" do
    bag = BagOfWords.new
    expect(bag).to be_a_bag_of_words
  end

  # Doesn't work very good
  it "is possible to verify if the bag isn't a bag of words" do
    bag = Array.new
    expect { bag.bag_of_words }.to raise_error(NoMethodError) 
  end


end