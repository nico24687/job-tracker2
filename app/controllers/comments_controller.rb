class CommentsController < ApplicationController 
  def create
    @comment = Comment.create(comment_params)

    redirect_to company_job_path(@comment.job.company_id, @comment.job_id )
  end 


  private 
    def comment_params 
      params.require(:comment).permit(:content).merge(params.permit(:job_id))
    end 
end 