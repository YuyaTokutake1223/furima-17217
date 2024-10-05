class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      puts @item.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit(:image, 
    :item_name, 
    :description, 
    :category_id, 
    :condition_id, 
    :shipping_cost_id, 
    :prefecture_id, 
    :shipping_duration_id, 
    :sales_price)
    .merge(user_id: current_user.id)
  end

  
end
