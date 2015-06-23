class ItemsController < ActionController::Base
  def create
    @user = current_user
    @list = @user.lists.find(params[:list_id])
    @items = @list.items

    @item = @list.items.build(item_params)


    if @item.save
      flash[:notice] = "Item added successfully"
    else
      flash[:error] = "There was an error adding your item to the list, please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = current_user
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice]= "#{@item.name} has been completed. Good Job!"
    else
      flash[:error]= "Sorry looks like there was a problem marking your item as complete, please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end