require 'rails_helper'

describe "User deletes existing job" do 
  scenario "a user can delete a job " do 
    category = Category.create!(title: "Random Category")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Manager", description: "manage things", level_of_interest: 70,  city: "denver", category: category)

    visit company_jobs_path(company)

   
      click_link "Delete"
   

    expect(page).to have_content("Manager was successfully deleted!")
    
  end 
end 

