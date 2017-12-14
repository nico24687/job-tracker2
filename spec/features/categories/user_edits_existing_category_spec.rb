require 'rails_helper'

describe "User edits an existing category" do 
  scenario "after clicking link from index page" do
    category = Category.create!(title: "Another Random Category")

    visit edit_category_path(category)

    fill_in "category[title]", with: "Even more random category"
    click_button "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Even more random category")


  end
end 