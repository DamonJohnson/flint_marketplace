class BookingsController < ApplicationController
  # REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :find_booking, only: [:show, :edit, :update, :save, :destroy, :duration, :check_auth]
  before_action :check_auth, only: [:update, :edit, :show, :destroy]

  def index
    @bookings = current_user.bookings.all

  end

  def new
    @item = Item.find(params[:item_id]) 
  end

  def show

  end


  def create
    begin
    @booking = current_user.bookings.create!(booking_params)
    current_user.add_role :booking_owner, @booking
    flash[:notice] = "Your item has been booked"
    redirect_to profile_path(current_user)
    rescue
    flash[:alert] = 'Your return date must be later than the hire date.'
    redirect_to new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def edit
  end

   def update 
      begin
      @booking.update!(require_params)
      flash[:notice] = "Successfully updated"   
      redirect_to profile_path(current_user)
      rescue
      flash[:alert] = 'Your return date must be later than the hire date'
      render 'edit'
    end
end

    def save 
      begin
      @booking.update!(require_params)
      render 'edit'
      rescue
      flash[:alert] = 'Your return date must be later than the hire date'
      render 'edit'
      end
    end

  def total_fee
    return
  end


  private

  def check_auth
    authorize @booking
  end

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
