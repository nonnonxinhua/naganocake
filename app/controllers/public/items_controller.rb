class Public::ItemsController < ApplicationController
 def index
  @items = Item.all
  @items = Item.page(params[:id])
 end
 def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
 end
end
