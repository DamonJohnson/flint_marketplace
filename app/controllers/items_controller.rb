class ItemsController < ApplicationController
  # REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :check_auth]
  before_action :check_auth, only: [:edit, :update, :destroy]
  before_action :get_categories, only: [:new, :edit]

 
  
  def index
    @items = Item.all
  end

  def show
  end

  def new
    Item.new
  end

  def create
    @item = current_user.items.create(item_params)
    current_user.add_role :item_owner, @item
    redirect_to @item 
    flash[:success] = "Item listed. Thanks for sharing"
  end

  def edit
     authorize @item
  end

  def update 
  if @item.update(require_params)
    flash[:success] = "Successfully updated"   
    redirect_to item_path(@item)
  else
    flash[:error] = "Error"   
    render :edit
  end
end

  def destroy  
    # @item.image.purge
    @item.destroy
    redirect_to items_path
  end


  private

  def check_auth
   authorize @item
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def get_categories
    @categories = Category.all
  end

  # params.permit method returns strong params and accepts only the specified parameters and removes controller and action. This protects against SQL injection.
  def item_params
    return params.permit(:title, :description, :price, :user_id, :category_id, :image)
  end

   def require_params
    return params.require(:item).permit(:title, :description, :price, :user_id, :category_id, :image)
  end

end