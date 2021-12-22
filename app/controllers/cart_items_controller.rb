class CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def show
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #カートの中に同じ商品が重複しないようにして古い商品と新しい商品の数量を合計する。
    @update_cart_item = CartItem.find_by(item: @cart_item.item)
    if @update_cart_item.present? && @cart_item.valid?
      @cart_item.quantity += @update_cart_item.quantity
      @update_cart_item.destroy
    end
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity].to_i)
    flash[:success] = "#{@cart_item.item.name}の数量を変更しました"
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path(@cart_item)
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path(@cart_item)
  end

  private

  def cart_item_params
    params.permit(:item_id, :quantity)
  end

end
