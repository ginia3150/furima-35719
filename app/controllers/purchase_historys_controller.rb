class PurchaseHistorysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_all, only: [:index, :create]
  before_action :move_to_pay, only: [:index, :create]
  def index
    @history_code = HistoryCode.new
  end

  def create
    @history_code = HistoryCode.new(history_code_params)
    if @history_code.valid?
      pay_product
      @history_code.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_code_params
    params.require(:history_code).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :tel).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(amount: @product.price, card: history_code_params[:token], currency: 'jpy')
  end

  def move_to_pay
    redirect_to root_path if current_user.id == @product.user_id || @product.purchase_history.present?
  end

  def product_all
    @product = Product.find(params[:product_id])
  end
end
