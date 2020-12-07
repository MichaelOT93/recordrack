class OrdersController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :correct_user, only: [:index, :show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show  
    @order_items = OrderItem.where(order_id: params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(:order_date => DateTime.now, :status => 'Pending')

    respond_to do |format|
      if @order.save
        @cart.line_items.each do |line_item| 

          @orderitem = @order.order_items.create!(
            record_id: line_item.record_id,
            quantity: line_item.quantity,
            title: line_item.record.title,
            artist: line_item.record.artist,
            price: line_item.record.price,
            year: line_item.record.year,
          )
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
          redirect_to root_url if @order.nil?
    end


    
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_date, :status, :user_id)
    end
end
