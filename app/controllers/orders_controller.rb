class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
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
      :contact_number
      ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

