class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end
  
  def update
  end

  def index
    
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
   def item_params
     params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image_id)
   end

end
