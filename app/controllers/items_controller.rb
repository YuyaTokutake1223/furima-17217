class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    
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
    end
  end

  def show
  end

  def edit
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

end
