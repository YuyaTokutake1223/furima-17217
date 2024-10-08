class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :new, status: :unprocessable_entity
    end   
  end


  private

  def order_params
    params.require(:order).permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

