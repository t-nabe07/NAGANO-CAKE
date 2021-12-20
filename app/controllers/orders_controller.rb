class OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.all
  end

  def create
    @order.find(params[])
  end

  def index
  end

  def show
  end

  def confirm
    o
  end

  def thanx
  end

  private

  def order_params
    params.requier(:order).permit(:payment_method)
  end


end
