require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Random Category")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category: category, company: company)
        
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Random Category")

        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category: category, company: company)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Random Category")

        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category: category, company: company)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company and category" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Random Category")

        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do 
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      
      expect(job).to respond_to(:category)
    end 
     it "has many comments in descending created at order" do 
      company = Company.create!(name: "BNY Mellon")
      category = Category.create!(title: "Finance")
      job = Job.create!(title: "Software", level_of_interest: 70, description: "Wahooo", city: "London", company_id: company.id, category_id: category.id )
      job.comments.create(content: "Oldest")
      job.comments.create(content: "Old")
      job.comments.create(content: "Newest")
      
      expect(job.comments.first.content).to eq("Newest")
    end 
    

  end
end
