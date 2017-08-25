class PortfoliosController < ApplicationController

  def index
    @port = Portfolio.all
  end

  def new
    @port = Portfolio.new
  end

  def create
    @port = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image ))

    respond_to do |format|
      if @port.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item exists now!!' }
        
      else
        format.html { render :new }
       
      end
    end
  end




end
