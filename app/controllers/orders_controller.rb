class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_item_pk, only: [:create, :new]

  
  def new
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path and return
    end
    
    if current_user.id == @item.user_id
      redirect_to root_path and return
    end
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end   
  end


  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, 
      :prefecture_id, 
      :city_town_village, 
      :street_address, 
      :building_name, 
      :contact_number,
      ).merge(
        user_id: current_user.id,
        item_id: params[:item_id],
        token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: params[:order_address][:price],
        card: order_params[:token],
        currency: 'jpy'
    )
  end

  def set_item_pk
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
  end


end

