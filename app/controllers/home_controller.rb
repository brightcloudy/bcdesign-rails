class HomeController < ApplicationController
  def index
    @featured_projects = Project.all.sort { |a, b| b.featured_status <=> a.featured_status }.first(3)
  end
end
