class CategorizationsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :destroy]

  def new
    @categorization = Categorization.new
    @project = Project.find(params[:project_id])
    @projects = Project.all
    @categories = Category.all
  end

  def create
    @project = Project.find(params[:project_id])
    @categorization = Categorization.new(params.require(:categorization).permit(:project_id, :category_id))
    if @categorization.save
      flash[:success] = "Categorization successfully added."
      redirect_to :back
    else
      flash[:error] = "Failed to add categorization!"
      redirect_to :back
    end
  end

  def destroy
    Categorization.find(params[:categorization][:id]).destroy

    flash[:success] = "Categorization successfully destroyed."
    redirect_to :back
  end
end
