class UsersController < ApplicationController
  def show
    @user  = User.find(params[:id])
    @ideas = @user.ideas.limit(6)
  end
end