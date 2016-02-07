class ChangeFeaturedDefault < ActiveRecord::Migration
  def change
    change_column_default :projects, :featured_status, 0
  end
end
