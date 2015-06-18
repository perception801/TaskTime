class UsersController < ApplicationController

  def show
    @user = current_user
    @lists = @user.lists
    @items = @user.items
  end

  def update
  end

  
end
