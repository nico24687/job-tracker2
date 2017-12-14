require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create!(title: "Tech")
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select(category.title, :from => 'job[category_id]')

    click_button "Create"
    
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(Job.last.category.title).to eq(category.title)
    
  end
  scenario "a user sees a link for a new category when creating a job" do 
    category = Category.create!(title: "Tech")
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)

    expect(page).to have_content("New Category")

  end 
end