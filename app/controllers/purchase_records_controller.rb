class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.purchase_record.present? 
      redirect_to root_path
    end

  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
      if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        render action: :index
      end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(purchase_params[:item_id]).price, 
      card: purchase_params[:token],   
      currency: 'jpy'               
    )
  end

end
