class Project < ActiveRecord::Base
  has_attached_file :image, styles: { large: "700x700#", medium: "400x400#", featured_thumb: "386x345#", thumb: "242x200#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true, length: { in: 5..20 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :status, presence: true, inclusion: { in: ["Complete", "In Progress", "Paused"], message: "%{value} is not a valid status" }
end
