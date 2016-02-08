class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name, :description))
    if @category.save
      flash[:success] = "Category created successfully!"
      redirect_to categories_path
    else
      flash[:error] = "Failed to create category."
      redirect_to :back
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @projects = @category.categorizations.collect { |x| x.project_id }.map { |x| Project.find(x) }
  end
end
