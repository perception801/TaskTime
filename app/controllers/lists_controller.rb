class ListsController < ApplicationController
  before_action :set_list


  def new
    @list = current_user.lists.new
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
    @list = current_user.lists.find(params[:id])
    @items = @list.items
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your list, please try again."
      render :edit
    end
  end

  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end

end