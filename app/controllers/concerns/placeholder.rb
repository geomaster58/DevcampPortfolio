module Placeholder
  extend ActiveSupport::Concern


  def self.img(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

end