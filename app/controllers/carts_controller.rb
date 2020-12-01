class CartsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
before_action :set_cart, only: [:show, :edit, :update, :destroy]


  


def index 
  @carts = Cart.all
end

def show
  @cart = Cart.find(params[:id])
end

def new 
  @cart = Cart.new
end

def edit

end

def create 
  @cart = Cart.new(cart_params)

  respond_to do |format|
    if @cart.save 
      format.html { redirect_to @cart, notice: 'Cart was successfully created.'}
      format.json { render :show, status: created, location: @cart}
    else 
      format.html { render :new}
      format.json { render json: @cart.errors, status: :unprocessable_entity}
    end
  end
end

def destroy

  @cart.destroy if @cart.id == session[:cart_id]
  session[:id] = nil
  respond_to do |format| 
    format.html { redirect_to cart_url, notice: "Cart was destroyed"}
    format.json { head :no_content }
  end
end


private

  def set_cart 
      @cart = Cart.find(session[:cart_id])
  end

  def cart_params 
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Invalid cart #{params[:id]}"
    redirect_to root_path, notice: "Cart doesn't exist"
    
  end



end



