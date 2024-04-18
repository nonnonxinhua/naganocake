class Public::OrdersController < ApplicationController

 def new
   @customer = current_customer
   @order = Order.new
 end

 def create
   @order = Order.new(order_params)
   @order.customer_id=current_customer.id
   @order.address=current_customer.address
   @order.postal_code=current_customer.postal_code
   @order.name=current_customer.last_name+current_customer.first_name
   @order.save!
   current_customer.cart_items.each do |cart_item|
    @order_detail=OrderDetail.new
    @order_detail.order_id=@order.id
    @order_detail.item_id=cart_item.item_id
    @order_detail.price=cart_item.item.price
    @order_detail.amount=cart_item.amount
    @order_detail.save
    cart_item.destroy
   end

  redirect_to  customers_orders_completion_path
 end

 def completion

 end

 def index
 @orders = current_customer.orders
 end

 def show
  @subtotal = 0
  @shipping_cost = 800
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end

 def confirmation
   @cart_items = current_customer.cart_items
   @order = Order.new(order_params)
   @order.postal_code=current_customer.postal_code
   @order.address=current_customer.address
   @order.name=current_customer.first_name+current_customer.last_name
   @shipping_cost = 800
   @subtotal = 0
 end

 private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:is_active,:payment_method,:address,:total_payment,:shipping_cost)
  end
end





