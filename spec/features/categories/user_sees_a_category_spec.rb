require 'rails_helper'

describe "user sees a single category" do 
  it  "after clicking a category name from the index page" do 
    category = Category.create!(title: "Possible Category")
    company = Company.create!(name: "BNY Mellon")
    job = Job.create!(title: "analyst", description: "analyze things", city: "London", level_of_interest: 20, company_id: company.id, category_id: category.id)

    visit category_path(category)
    
    expect(page).to have_content(category.title)
    expect(page).to have_content(job.title)
  end 
end 