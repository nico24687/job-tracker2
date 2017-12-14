require 'rails_helper'

describe "User sees all categories" do 
  scenario "a user sees all the categories" do 
    Category.create!(title: "Finance")
    Category.create!(title: "Law")
    Category.create!(title: "Tech")

    visit categories_path
    
    expect(page).to have_content("Finance")
    expect(page).to have_content("Law")
    expect(page).to have_content("Tech")
  end 
end 