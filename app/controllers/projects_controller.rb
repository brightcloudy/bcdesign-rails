class ProjectsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :new, :destroy, :edit, :update]

  def new
  end

  def create
    @project = Project.new(params.require(:projects).permit(:title, :description, :image, :status))
    @project.save

    flash[:success] = "Project created successfully!"
  
    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    #if params[:projects].has_key?(:image)
    # updateparams = 

    if @project.update(projects_params)
      flash[:success] = "Project edited successfully!"
      redirect_to @project
    else
      flash[:alert] = "Project edit failed!"
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:success] = "Project deleted successfully."

    redirect_to projects_path
  end

  private
    def projects_params
      params.require(:projects).permit(:title, :description, :status, :image)
    end
end
