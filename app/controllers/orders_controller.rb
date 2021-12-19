class OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanx
  end

  private

  def order_params
    params.requier(:order).permit(:payment_method)
  end


end
