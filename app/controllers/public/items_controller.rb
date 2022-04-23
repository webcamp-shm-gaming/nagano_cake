class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
   params.require(:item).permit(:image, :name, :introduction, :genre_id, :is_active)
  end
end
