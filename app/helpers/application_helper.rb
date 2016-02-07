module ApplicationHelper
  def site_name
    "Bright Cloud Design"
  end

  def site_url
    if Rails.env.production?
      "http://brightcloud.design/"
    else
      "http://brightcloud.design:8080/"
    end
  end

  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end
end
