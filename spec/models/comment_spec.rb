require 'rails_helper'

describe Comment do 
  describe "relationships" do 
    it "belongs to a job " do 
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      comment = Comment.new(content: "this is a great job", job_id: job.id)

      expect(comment).to respond_to(:job)

    end 
  end 
end 