class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end

  def index_customer
    @customer_orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    @customer_name = Order.find_by(customer_id: params[:id]).name
  end


  private
    def order_params
      params.require(:order).permit(:status)
    end

end
