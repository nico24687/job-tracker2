

class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])

    if params[:sort] == "location"
      @jobs = @company.jobs.order(:city)
    elsif params[:sort] == "interest"
      @jobs = @company.jobs.order(:level_of_interest)
    else
      @jobs = @company  .jobs
    end
    @contact = Contact.new(company: @company)
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = @job.company
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to company_jobs_path(@company)
  end

  def destroy
    job = Job.find(params[:id])

    job.destroy 

    flash[:success] = "#{job.title} was successfully deleted!"

    redirect_to company_jobs_path(job.company_id)
  end

  def location 
    @jobs = Job.where(city: params[:location]).includes(:company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end


end
