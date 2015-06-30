class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    @list = current_user.lists.build
  end

  def update
  end

private

def list_params
    params.require(:list).permit(:name, :description)
  end
  
end
