class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show,  :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :create, :new, :update, :edit, :sort]}, site_admin: :all

  def index
    @ports = Portfolio.by_position
      
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end 

  def angular
    @angular_portfolio = Portfolio.angular
  end

  def rails 
    @ruby = Portfolio.ruby_on_rails
  end

  def new
    @ports = Portfolio.new
    @ports.technologies.build 
  end

  def show
  end  

   def create
    @port = Portfolio.new(portfolio_params)

    respond_to do |format|

      if @port.save
        
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit 
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
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      :thumb_image, 
                                      :main_image, 
                                      technologies_attributes: [:id, :name, :_destroy])                                      
  end

  def set_portfolio_item
    @ports = Portfolio.find(params[:id])
  end


end
