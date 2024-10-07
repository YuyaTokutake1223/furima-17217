class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :current_user_id_judge, only: [:edit]

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
  
  def current_user_id_judge
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

end
