class PortfoliosController < ApplicationController

  def index
    @port = Portfolio.all
  end

  def new
    @port = Portfolio.new
  end

  def show
    @port = Portfolio.find(params[:id])
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

  def edit 
    @port = Portfolio.find(params[:id]) 
    
  end

  def update

    @port = Portfolio.find(params[:id]) 

    respond_to do |format|
      if @port.update(params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image ))
        format.html { redirect_to portfolios_path, notice: 'You updated you portfolio!!' }
        
      else
        format.html { render :edit }
        
      end
    end
  end  

  def destroy
    @port = Portfolio.find(params[:id]) 

    @port.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Removed!!' }
    end
  end  


end
