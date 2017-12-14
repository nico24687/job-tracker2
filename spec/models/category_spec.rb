require 'rails_helper'

describe Category do 
  describe "validations" do 
    it "is invalid without a title " do 
      category = Category.new

      expect(category).to be_invalid
    end
    it "is valid with a title" do 
      category = Category.new(title: "Random Category")

      expect(category).to be_valid
    end 

     it "has a unique title" do 
      Category.create(title: "Random Category")
      category = Category.new(title: "Random Category")

      expect(category).to be_invalid
    end 
  end 

  describe "relationships" do 
    it "has many job " do 
      category = Category.new(title: "Random Category")

      expect(category).to respond_to(:jobs)
    end 
  end 

end 