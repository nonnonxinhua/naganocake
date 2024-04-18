class Admin::ItemsController < ApplicationController
  def new
   @item = Item.new
  end

  def update


  end

  def show
   @item = Item.find(params[:id])
  end

  def index
   @items = Item.all.page(params[:page])
  end

  def create
  @item = Item.new(item_params)
  @item.save
  redirect_to admin_item_path(@item.id)
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name,:introduction,:genre_id,:price,:is_active,)
  end
end
