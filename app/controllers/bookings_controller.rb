class BookingsController < ApplicationController
  # REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :find_booking, only: [:show, :edit, :update, :destroy, :duration]

  def index
    @bookings = current_user.bookings.all
    
  end

  def new
    Booking.new
  end

  def show
  end


  def create
    @booking = current_user.bookings.create(booking_params)
    flash.alert = "Your item has been booked"
    redirect_to profile_path(current_user)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def edit
  end

   def update 
    if @bookings.update(require_params)
      flash[:success] = "Successfully updated"   
      redirect_to edit
    else
      flash[:error] = "Error"   
      render :edit
    end
end



  def total_fee
    return
  end


  private

  def booking_params
    return params.permit(:user_id, :item_id, :start_date, :end_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def require_params
    return params.require(:booking).permit(:user_id, :item_id, :start_date, :end_date)
  end



  

end
