class PurchaseHistorysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_pay, only: [:index, :create]
  def index
    @history_code = HistoryCode.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
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
      params.require(:history_code).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def pay_product
      Payjp.api_key = "sk_test_57d0135be66ab5ab6e067ec9"
      Payjp::Charge.create(amount: @product.price, card: history_code_params[:token], currency: 'jpy')
    end

    def move_to_pay
      @product = Product.find(params[:product_id])
      if current_user.id == @product.user_id || @product.purchase_history.present?
        redirect_to root_path
      end
    end
end