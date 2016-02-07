class HomeController < ApplicationController
  def index
    @featured_project = Project.all.max_by { |x| x.featured_status }
  end
end
