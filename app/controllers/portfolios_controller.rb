class PortfoliosController < ApplicationController
  layout "portfolio"


  def index
    @ports = Portfolio.all
  end

  def angular
    @angular_portfolio = Portfolio.angular
  end

  def rails 
    @ruby = Portfolio.ruby_on_rails
  end

  def new
    @ports = Portfolio.new
    3.times { @ports.technologies.build }
  end

  def show
    @ports = Portfolio.find(params[:id])
  end  

  def create
    @ports = Portfolio.new(portfolio_params)

    

    respond_to do |format|
      if @ports.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item exists now!!' }
        
      else
        format.html { render :new }
       
      end
    end
  end

  def edit 
    @ports = Portfolio.find(params[:id]) 
     3.times { @port.technologies.build }
  end

  def update

    @ports = Portfolio.find(params[:id]) 

    respond_to do |format|
      if @ports.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'You updated you portfolio!!' }
        
      else
        format.html { render :edit }
        
      end
    end
  end  

  def destroy
    @ports = Portfolio.find(params[:id]) 

    @ports.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Removed!!' }
    end
  end  


  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image)                                      
  end



end
