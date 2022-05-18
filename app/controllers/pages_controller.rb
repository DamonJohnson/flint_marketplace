class PagesController < ApplicationController
  def index
    if user_signed_in? && current_user.profile == nil
      redirect_to profiles_path
    end
  end
end
