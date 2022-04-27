class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update]
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_items_path, notice: "商品を登録しました"
    else
      @items = Item.all
      render :new
    end
  end

  def index
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     redirect_to admin_item_path(@item.id), notice: "商品を変更しました"
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
