class OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.all
    @customer = Customer.find(current_customer.id)
  end

  def create
    order = current_customer.orders.new(order_params)
    order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
    OrderItem.create(
      item_id: cart_item.item.id,
      order_id: order.id,
      quantity: cart_item.quantity,
      price: cart_item.subtotal
    )
    end
    cart_items.destroy_all
    redirect_to orders_thanx_path
  end


  def index
    @orders = current_customer.orders
    
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @total_payment = 0
    @order_items.each do |order_item|
      @total_payment += order_item.item.add_tax_sales_price * order_item.quantity
    end
    @amount_billed = @total_payment + @order.shipping_cost
  end

  def confirm
    @cart_items = current_customer.cart_items
    # <!--カートに入ってる商品の合計金額-->
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    @order = Order.new(order_params)
    @order.shipping_cost = 800.to_i
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
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :shipping_cost, :total_payment)
  end

end
