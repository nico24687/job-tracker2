require 'rails_helper'

describe Contact do 
  describe "relationships" do 
    it "belongs to a company" do 
      contact = Contact.new
      expect(contact).to respond_to(:company)
    end 
  end 
end 