class Category < ActiveRecord::Base
  has_many :projects, :through => :categorizations
  has_many :categorizations
end
