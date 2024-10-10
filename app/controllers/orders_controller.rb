class OrdersController < ApplicationController
  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])
      render :new, status: :unprocessable_entity
    end   
  end


  private

  def order_params
    params.require(:order_address).permit(
      :item_id,
      :postal_code, 
      :prefecture_id, 
      :city_town_village, 
      :street_address, 
      :building_name, 
      :contact_number,
      :price
      ).merge(
        user_id: current_user.id,
        item_id: params[:item_id],
        token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
    )
  end

end

