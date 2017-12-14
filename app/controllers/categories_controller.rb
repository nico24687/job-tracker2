class CategoriesController < ApplicationController 
  def new 
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      flash[:success] = ""
      @category.errors.full_messages.each do |message|
        flash[:success] += "#{message}, "
      end 
      
      render :new 
    end
  end 

  def index
    @categories = Category.all
  end 

  def show 
    @category = Category.find(params[:id])
  end 

  def destroy 
    @category = Category.find(params[:id])
    @category.destroy 

    redirect_to categories_path
  end 

  def edit 
    @category = Category.find(params[:id])
  end 

  def update 
    @category = Category.find(params[:id])
    @category.update(category_params)
    

    redirect_to categories_path
  end 
    

  private 

    def category_params
      params.require(:category).permit(:title)
    end 
end 