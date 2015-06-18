class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:notice] = "Your list was created successfully"
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your new list, please try again."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your list, please try again."
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end

end