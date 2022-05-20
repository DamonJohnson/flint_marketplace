class BookingsController < ApplicationController
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

  #  Uses devise current_user method to create a new booking record to current user
  def create
    begin
    @booking = current_user.bookings.create!(booking_params)
    # Assigns current user role of booking owner scope to @booking. Used for authorisation check.
    current_user.add_role :booking_owner, @booking
    flash[:notice] = "Your item has been booked"
    redirect_to profile_path(current_user.profile)
    rescue
    flash[:alert] = @booking.errors.full_messages.join('.  ')
    redirect_to new
    end
  end

  #  destroys select bookign record and redirects to bookings index
  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def edit
  end

  #  Updates current booking.
   def update
      begin
      @booking.update!(require_params)
      # Renders edit so the user can save the adjusted booking duration to check the updated total fee. User can then return to other pages when they are happy with updated price.
      render 'edit'
      rescue
      flash[:alert] = 'Your return date must be later than the hire date'
      render 'edit'
      end
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
