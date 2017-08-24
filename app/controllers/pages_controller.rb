class PagesController < ApplicationController
  def homepage
    @posts = Blog.all
  end

  def about
  end

  def contact
  end
end
