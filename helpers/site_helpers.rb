module SiteHelpers

  def page_title
    title = "We Just Do Stuff"
    if data.page.title
      title =  data.page.title + " | " + title
    end
    title
  end

  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Set your site description in /helpers/site_helpers.rb"
    end
    description
  end

end