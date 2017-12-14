require 'rails_helper'

describe "User deletes a category " do 
  scenario "from the index page " do
    category = Category.create!(title: "Random Category")

    visit categories_path 
    

  
      click_link "Delete"
    

    expect(Category.count).to eq(0)
    expect(current_path).to eq(categories_path)
  end 
end 