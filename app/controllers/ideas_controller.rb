class IdeasController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  # Allow filtering ideas in a list by a user id:
  has_scope :by_user

  def index
    @ideas  = apply_scopes(Idea)
      .includes(:user, :votes)
      .order("created_at DESC")
      .paginate(page: params[:page], per_page: 10)

    # to-do: #current_scopes can be used to get a list
    # of scopes being used in the index - might be neat
    # to allow toggling these
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
  
  def vote
    @idea = Idea.find(params[:id])

    # Do not allow a user to vote for his own idea:
    unless current_user == @idea.user
      @idea.vote voter: current_user
    end
  end

protected
  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end