class UserController < ApplicationController
  def show
    @user = current_user
    @authoriation
  end
end
