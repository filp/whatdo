class IdeasController < ApplicationController
  def index
    @ideas = Idea.includes(:user).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
  end
end
