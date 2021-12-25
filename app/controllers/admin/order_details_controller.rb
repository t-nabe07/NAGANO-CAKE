class Admin::OrderDetailsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = OrderItem.where(order_id: @order_item.order_id).pluck('making_status')
    order_status = @order_item.order
    if @order_item.making_status == "be_making"
      order_status.update(status: "be_making")
      redirect_to request.referer
    elsif @order_items.all?{ |w| w == 'has_been_shiped' }
      order_status.update(status: "ready_to_ship")
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:making_status)
    end
end
