class IdeasController < ApplicationController
  def index
    @ideas = Idea.includes(:user).all
  end

  def show
  end

  def new
  end
end
