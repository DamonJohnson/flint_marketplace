class ItemsController < ApplicationController
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

  # Leverages devise current_user method to create item where item is controllers
  def create
    begin
    @item = current_user.items.new(item_params)
    @item.save!
    # User is assigned item_owner scoped to item for item policy
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
    @item.image.purge
    @item.destroy
    redirect_to items_path
  end


  private

  # Checks if current user is creator of @item
  def check_auth
   authorize @item
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def get_categories
    @categories = Category.all
  end

# Does not require item id. Used for creating new items
  def item_params
    return params.permit(:title, :description, :price, :user_id, :category_id, :image)
  end

# Returns parameters for current @item, requires item id
   def require_params
    return params.require(:item).permit(:title, :description, :price, :user_id, :category_id, :image)
  end

  # Establishes set of categories for item creation and searching. Needs to be item controller as it is called before creation of items.
  def set_categories
    @categories = Category.create([{name: "4WD"},{name: "Campervan"},{name: "Caravan"},{name: "Boat"},{name: "Kayak / Canoe"},{name: "Bike"},{name: "Camping Equipment"},{name: "Surf"},{name: "Snow"},{name: 'Other'}])
  end

end