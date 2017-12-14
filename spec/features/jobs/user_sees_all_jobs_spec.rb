require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    category = Category.create!(title: "Random Category")

    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
  scenario "a user can create a contact for the company" do
    company = Company.create!(name: "ESPN")

    visit company_path(company)
    fill_in('contact[full_name]', :with => 'Jenny Beck')
    fill_in('contact[position]', :with => 'Manager')
    fill_in('contact[email]', :with => 'jenny@company.com')

    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Jenny Beck")
  end
end


