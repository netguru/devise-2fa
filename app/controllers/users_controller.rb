class UsersController < ApplicationController
  def show
    @user = User.find_by_id params[:id]
  end

  def update
    @user = User.find_by params[:id]
    @user.update_attribute(:avatar_url, params[:user][:avatar_url])
    @user.save
  end
end
