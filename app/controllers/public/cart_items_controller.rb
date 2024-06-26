class Public::CartItemsController < ApplicationController

  def index
   @cart_items = current_customer.cart_items
   @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
   @cart_item = current_customer.cart_items.find(params[:id])
   @cart_item.destroy
   redirect_to cart_items_path
  end

  def destroy_all
   @cart_items = current_customer.cart_items
   @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if@item.present?
     # 被りがあった場合の処理
     new_amount =@item.amount+@cart_item.amount
     @item.update_attribute(:amount,new_amount)
    else
     # 被りがなかった場合の処理
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


end
