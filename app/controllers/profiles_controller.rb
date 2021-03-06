class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :find_profile, only: [:show, :edit, :update, :destroy, :check_auth]
before_action :check_auth, only: [:show, :edit, :update, :destroy]
before_action :list_states, only: [:new, :edit]



  def index
  @profiles = Profile.all
  end

  #  Builds new profile upon creation of account
  def new 
  @profile = current_user.build_profile
  end

  # Builds new user and saves with association to current_user
  def create
    begin
    @profile = current_user.build_profile(profile_params)
    @profile.save!
    # Assigns role of profile_owner to current user for authorization checks
    current_user.add_role :profile_owner, @profile
    flash[:notice] = "Profile saved"
    redirect_to @profile
    rescue
    flash[:alert] = @profile.errors.full_messages.join('<br>')
    redirect_to new
    end
  end


  # Require @items and @books to build @profile page. @profile page acts as a dashboard for user.
  def show
    @profile = Profile.find(params[:id])
    @items = current_user.items.all
    @bookings = current_user.bookings.all
  end

  def edit
  end

  def update
    begin
      @profile.update!(profile_params)
      flash[:notic] = "Successfully updated profile"   
      redirect_to profile_path
    rescue
      flash[:alert] = @profile.errors.full_messages.join('<br>')
      redirect_to edit_profile_path
    end
  end


  private

  def check_auth
    authorize @profile
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :city, :postcode, :state)
  end

  def list_states
   @states = ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia', 'Tasmania', 'Australian Capital Territory', 'Northern Territory']
  end

 
end