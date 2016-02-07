class ProjectsController < ApplicationController
  def new
  end

  def create
    @project = Project.new(params.require(:projects).permit(:title, :description, :image, :status))
    @project.save
  
    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  private
    def projects_params
      params.require(:projects).permit(:title, :description, :status, :image)
    end
end
