class ProfilesController < ApplicationController
# REMOVE FOR PRODUCTION!
skip_before_action :verify_authenticity_token
before_action :authenticate_user!
before_action :check_auth
before_action :list_states, only: [:new, :edit]
before_action :find_profile, only: [:show, :edit, :update, :destroy]

# respond_to :html

  def index
    @profiles = Profile.all
   
  end

  def new 
  @profile = current_user.build_profile
  end

def create
  @profile = current_user.build_profile(profile_params)
  if @profile.save
    current_user.add_role :profile_owner, @profile
    flash[:success] = "Profile saved"
    redirect_to @profile
  else
    flash[:error] = "Error"
    redirect_to new
  end
end

  def show
    @profile = Profile.find(params[:id])
    @user_items = current_user.items.all
    @bookings = current_user.bookings.all
  end

def edit
  
end

def update
  if @profile.update(profile_params)
    flash[:success] = "Successfully updated"   
    redirect_to profile_path
  else
    flash[:error] = "Error"    
    render :edit
  end
end


  private

    def check_auth
      authorize Profile
    end

    def find_profile
      @profile = Profile.find(params[:id])
    end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :city, :postode, :state)
  end

  def list_states
   @states = ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia', 'Tasmania', 'Australian Capital Territory', 'Northern Territory']
  end

 
end