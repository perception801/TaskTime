class ListsController < ApplicationController
  before_action :set_list, :except =>[:create]


  def new
    @list = List.new
  end

  def create
    @new_list = List.new
    @list = current_user.lists.build(list_params)
    
    if @list.save
      flash[:notice] = "Your list was created successfully"
    else
      flash[:error] = "There was an error saving your new list, please try again."
   end
   
    respond_to do |format|
      format.html
      format.js
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
    

    if @list.destroy
      flash[:notice]= "#{@list.name} has been removed."
    else
      flash[:error]= "Sorry looks like there was a problem removing your list, please try again."
    end

    respond_to do |format|
      format.html
      format.js
  end
end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end

end