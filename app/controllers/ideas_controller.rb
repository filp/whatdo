class IdeasController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.includes(:user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.build(idea_params)

    if @idea.save
      redirect_to idea_path(@idea), success: "Your idea has been shared!"
    else
      render :new
    end
  end

protected
  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end