class ItemsController < ApplicationController
  # REMOVE FOR PRODUCTION!!!
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :check_auth]
  before_action :check_auth, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :update, :create]


 
  
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    
  end



  def show
  end

  def new

  end

  def create
    begin
    @item = current_user.items.new(item_params)
    @item.save!
    current_user.add_role :item_owner, @item
    flash[:notice] = "Item listed. Thanks for sharing."
    redirect_to @item
    rescue
    flash[:alert] = @item.errors.full_messages.join('.  ')
    redirect_to new_path
    end
  end

  def edit
  end

  def update 
    begin
    @item.update!(require_params)
    flash[:notice] = "Successfully updated"   
    redirect_to item_path(@item)
    rescue
    flash[:alert] = @item.errors.full_messages.join('.  ')   
    render 'edit'
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

  def item_params
    return params.permit(:title, :description, :price, :user_id, :category_id, :image)
  end

   def require_params
    return params.require(:item).permit(:title, :description, :price, :user_id, :category_id, :image)
  end

  def set_categories
    @categories = Category.create([{name: "4WD"},{name: "Campervan"},{name: "Caravan"},{name: "Boat"},{name: "Kayak / Canoe"},{name: "Bike"},{name: "Camping Equipment"},{name: "Surf"},{name: "Snow"},{name: 'Other'}])
  end

end