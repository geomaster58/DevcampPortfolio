module DefaultPageContent
  extend ActiveSupport::Concern

 included do 
    before_action :set_page_default
  end
  
  def set_page_default
    @page_title = "DevCamp Portfolio | JJ Keeney"
    @seo_keywords = "JJ Keeney portfolio"
  end



end