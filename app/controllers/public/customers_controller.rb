class Public::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
   @customer = Customer.new
  end

  def show
    @customers = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def withdraw

  end

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

   private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telphone_number, :password)
  end
end
