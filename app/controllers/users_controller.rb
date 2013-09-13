class UsersController < ApplicationController
  def show
    @user  = User.find(params[:id])
    @ideas = @user.ideas.includes(:votes).limit(6)
  end
end