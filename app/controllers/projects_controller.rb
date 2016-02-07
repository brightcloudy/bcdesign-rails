class ProjectsController < ApplicationController
  def new
  end

  def create
    newparams = params[:projects]
    @project = Project.new
    @project.title = newparams[:title]
    @project.description = newparams[:description]
    @project.status = newparams[:status]
    @project.last_updated = Time.new
    uploadedimage = newparams[:image]
    newname = SecureRandom.hex(3)
    fname = Rails.root.join('public', 'uploads', newname.concat('.').concat(uploadedimage.content_type.split('/')[1]))
    File.open(fname, 'wb') do |file|
      file.write(uploadedimage.read)
    end
    @project.image = fname
    @project.save
  
    redirect_to @project
  end

  private
    def projects_params
      params.require(:projects).permit(:title, :description, :status, :image, :last_updated)
    end
end
