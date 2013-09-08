class IdeasController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.includes(:user).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @idea = Idea.new
  end
end