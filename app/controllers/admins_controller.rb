class AdminsController < ApplicationController
    before_action :authenticate_admin!

    def change_status
      @parcel_order = ParcelOrder.find(params[:id])
      new_status = params[:status]
      if @parcel_order.update(status: new_status)
        # Handle successful status change
        redirect_to @parcel_order, notice: 'Status changed successfully!'
      else
        # Handle failed status change
        redirect_to @parcel_order, alert: 'Unable to change status.'
      end
    end
  
    def change_location
      @parcel_order = ParcelOrder.find(params[:id])
      new_location = params[:location]
      if @parcel_order.update(present_location: new_location)
        # Handle successful location change
        redirect_to @parcel_order, notice: 'Location changed successfully!'
      else
        # Handle failed location change
        redirect_to @parcel_order, alert: 'Unable to change location.'
      end
    end
  
    private
  
    def authenticate_admin!
        unless current_user && current_user.is_admin?
            # If user is not logged in or not an admin, redirect or show unauthorized page
        redirect_to login_path, alert: 'You are not authorized to access this page.'
    end
  end
end
