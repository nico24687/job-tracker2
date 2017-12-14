require 'rails_helper'

describe Dashboard do
  describe "job_count_by_level_of_interest" do
    let(:dashboard) { Dashboard.new }

    before do
      company = Company.create(name: "Random Company")
      category = Category.create(title: "Random Category")
      company.jobs.create!(category: category, title: "Interesting Job", level_of_interest: 100, city: "Montreal")
      company.jobs.create!(category: category, title: "Another Interesting Job", level_of_interest: 100, city: "Montreal")
      company.jobs.create!(category: category, title: "Not So Interesting Job", level_of_interest: 50, city: "Montreal")
      company.jobs.create!(category: category, title: "Bad Job", level_of_interest: 0, city: "Montreal")
    end
    
    it "groups the jobs by level of interest" do
      expect(dashboard.job_count_by_level_of_interest).to eq([
        { level_of_interest: 0, count: 1},
        { level_of_interest: 50, count: 1 },
        { level_of_interest: 100, count: 2 }
      ])
    end    
  end 

  describe "job_count_by_location" do
    let(:dashboard) { Dashboard.new }

    before do
      company = Company.create(name: "Random Company")
      category = Category.create(title: "Random Category")
      company.jobs.create!(category: category, title: "Interesting Job", level_of_interest: 100, city: "Montreal")
      company.jobs.create!(category: category, title: "Not So Interesting Job", level_of_interest: 50, city: "Denver")
      company.jobs.create!(category: category, title: "Bad Job", level_of_interest: 0, city: "Denver")
      company.jobs.create!(category: category, title: "Bad Job", level_of_interest: 0, city: "London")
    end
    
    it "groups the jobs by city" do
      expect(dashboard.job_count_by_location).to eq([
        { city: "Denver", count: 2},
        { city: "London", count: 1 },
        { city: "Montreal", count: 1 }
      ])
    end    
  end 

  describe "top_companies" do
    let(:dashboard) { Dashboard.new }
    let(:company) { Company.create(name: "Random Company") }
    let(:company2) { Company.create(name: "Random Company 2") }
    let(:company3) { Company.create(name: "Random Company 3") }

    before do
      company4 = Company.create(name: "Random Company 4")
      category = Category.create(title: "Random Category")
      company.jobs.create!(category: category, title: "Interesting Job", level_of_interest: 100, city: "Montreal")
      company.jobs.create!(category: category, title: "Another Interesting Job", level_of_interest: 100, city: "Montreal")
      company2.jobs.create!(category: category, title: "Not So Interesting Job", level_of_interest: 50, city: "Montreal")
      company2.jobs.create!(category: category, title: "Bad Job", level_of_interest: 0, city: "Montreal")
      company3.jobs.create!(category: category, title: "Not So Interesting Job", level_of_interest: 30, city: "Montreal")
      company3.jobs.create!(category: category, title: "Bad Job", level_of_interest: 30, city: "Montreal")
      company4.jobs.create!(category: category, title: "Not So Interesting Job", level_of_interest: 10, city: "Montreal")
      company4.jobs.create!(category: category, title: "Bad Job", level_of_interest: 10, city: "Montreal")


    end
    
    it "returns the top three companies and their level of interest" do
      # Job.group(:company).average(:level_of_interest)
      expect(dashboard.top_companies).to eq([
        { company: company, level_of_interest: 100 },
        { company: company3, level_of_interest: 30 },
        { company: company2, level_of_interest: 25 } 
      ])
    end
  end 
end