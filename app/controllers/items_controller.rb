class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(12)
    @item_count = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
