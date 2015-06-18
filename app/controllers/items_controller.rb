class ItemsController < ActionController::Base
  def create
    @user = current_user
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.new(item_params)

    if @item.save
      flash[:notice] = "Item added successfully"
      redirect_to [@user, @list]
    else
      flash[:error] = "There was an error adding your item to the list, please try again."
      render :create
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end