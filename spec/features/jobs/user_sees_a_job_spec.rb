require 'rails_helper'

describe "User sees a specific job" do
  before(:each) do 
    @category = Category.create!(title: "Random Category")
    @company = Company.create!(name: "ESPN")
    @job = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: @category)
  end 
  scenario "a user sees a job for a specific company" do

    visit company_job_path(@company, @job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
  it "sees a form to make a comment" do 

    visit company_job_path(@company, @job)
    
    page.should have_css('form')

  end
  it "can submit a comment and see it" do 
    visit company_job_path(@company, @job)

    fill_in('comment[content]', :with => 'This looks great')
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(@company, @job))
    expect(page).to have_content("This looks great")
    
  end 
  it "can see multiple comments from most recent" do 
    @job.comments.create!(content: "oldest")
    @job.comments.create!(content: "slightly old")
    @job.comments.create!(content: "newest")

    visit company_job_path(@company, @job)

    expect(page).to have_selector("div:nth-of-type(1)", text: "newest")
    expect(page).to have_selector("div:nth-of-type(2)", text: "slightly old")
    expect(page).to have_selector("div:nth-of-type(3)", text: "oldest")
  end 
end
