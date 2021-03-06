class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    if @item.order.present? || current_user.id != @item.user_id
    redirect_to action: :index 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
    if @item.destroy
    redirect_to root_path 
    end
  end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_day_id,
                                 :description, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  

end
