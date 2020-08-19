module ApplicationHelper
  def full_title(page_title = "")
    default_title = "モノツク"
    if page_title.empty?
      default_title
    else
      page_title + " - " + default_title
    end
  end
end
