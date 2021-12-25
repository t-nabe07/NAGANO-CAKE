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
    p @order
    if @order.status == "payment_confirmation"
      making_status = OrderItem.where(order_id: @order.id)
      making_status.update(making_status: "wating_for_making")
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def index_customer
    @customer_orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    @customer_name = Order.find_by(customer_id: params[:id]).customer.full_name
  end


  private
    def order_params
      params.require(:order).permit(:status)
    end

end
