class ParcelOrdersController < ApplicationController
    before_action :set_user

    def index
      render json: ParcelOrder.where(user_id: @user.id).all
    end
  
    def create
      @user.transaction do
        parcel_order = @user.parcel_orders.create!(destination: parcel_order_params[:destination])
  
        render json: parcel_order, status: :created
      end
    end
  
    def show
      @parcel_order = ParcelOrder.find(params[:id])
      render json: @parcel_order
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def parcel_order_params
      params.permit(:destination)
    end
end
