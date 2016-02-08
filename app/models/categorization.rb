class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :project

  def category_name
    Category.find(self[:category_id]).name
  end
end
