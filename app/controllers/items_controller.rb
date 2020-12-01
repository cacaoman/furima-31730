class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :state_id, :delivery_charge_id, :time_to_ship_id, :ship_from_id).merge(user_id: current_user.id)
  end
end
