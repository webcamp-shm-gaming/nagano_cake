class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # 今ログインしている会員がもつカート商品:customerモデルとcart_itemモデルは1対多の関係なので、cart_itemは複数形
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
      # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
      #ex.バナナ２個、バナナ２個ではなくバナナ「4個」にしたい
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      #元々カート内にあるもの「item_id」
      #今追加したparams[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      #cart_item.quantityに今追加したparams[:cart_item][:amount]を加える
      #.to_iとして数字として扱う
      cart_item.amount = cart_item.amount+params[:cart_item][:amount].to_i
      cart_item.save

      # もしカート内に「同じ」商品がない場合は通常の保存処理
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = "商品を更新しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "商品を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private
  # 商品カート（cart_itemモデル）の商品id（item_id）と数量（amount）の値を取り出しDBに保存するためのパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
