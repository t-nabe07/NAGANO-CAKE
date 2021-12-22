class OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.all
    @customer = Customer.find(current_customer.id)
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_thanx_path
    
  end
  

  def index
    @orders = Order.all
    
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_addres] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_addres] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end
    
    
  
  end

  def thanx
    
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)

  end


end
