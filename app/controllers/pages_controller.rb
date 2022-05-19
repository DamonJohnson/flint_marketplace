class PagesController < ApplicationController
  def index
    if user_signed_in? && current_user.profile == nil
      redirect_to profiles_path
    end
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
end
