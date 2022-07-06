class ItemsController < ApplicationController
<<<<<<< Updated upstream

  def index 
=======
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_day_id, :description, :user, :image).merge(user_id: current_user.id)
>>>>>>> Stashed changes
  end
  
end
