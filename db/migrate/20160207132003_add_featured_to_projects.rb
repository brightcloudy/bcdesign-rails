class AddFeaturedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_status, :integer
  end
end
