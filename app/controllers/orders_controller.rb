class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    binding.pry
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path

    # if @address.valid?
    #   @order.save
    #   @address.save
    #   redirect_to root_path
    # else
    #   @item = Item.find(params[:item_id])
    #   render :new, status: :unprocessable_entity
    # end   
  end


  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(
      :postal_code, 
      :prefecture_id, 
      :city_town_village, 
      :street_address, 
      :building_name, 
      :contact_number
    ).merge(order_id: @order.id)
  end

end

