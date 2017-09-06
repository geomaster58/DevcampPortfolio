class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show,  :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :create, :new, :update, :edit]}, site_admin: :all

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
     3.times { @port.technologies.build }
  end

  def update

     

    respond_to do |format|
      if @ports.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'You updated you portfolio!!' }
        
      else
        format.html { render :edit }
        
      end
    end
  end  

  def destroy
    

    @ports.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Removed!!' }
    end
  end  


  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image)                                      
  end

  def set_portfolio_item
    @ports = Portfolio.find(params[:id])
  end


end
