require 'rails_helper'

describe "User can edit an existing job" do 
  scenario "a user can edit a new job" do 
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Finance")
    job = company.jobs.create!(title: "manager", description: "manage things", level_of_interest: 70,  city: "denver", category_id: category.id)

    visit edit_company_job_path(job.company, job)

    fill_in "job[title]", with: "Random Position"
    click_button "Create Job"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Random Position")
  end 

  # when the job data is invalid?
end 