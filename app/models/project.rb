class Project < ActiveRecord::Base
  has_attached_file :image, styles: { large: "700x700#", medium: "400x400#", thumb: "242x200#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
