class Admin::OrdersController < ApplicationController

  def show
   @order = Order.find(params[:id])
   @customer = @order.customer
   @order_details = @order.order_details
   @subtotal =0
   @shipping_cost =800
  end

  def new
   @orders = order.new
  end
end
