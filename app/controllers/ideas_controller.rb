class IdeasController < ApplicationController

before_action :find_idea, only: [ :edit, :destroy, :update]

before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
    
    # @like = @ideas.like_for(current_user) || like.new
  
  end

  def create
    @idea = current_user.ideas.new(idea_attributes)
     #idea_attributes = params.require(:idea).permit([:title, :description])
  
#@idea.user =current_user
  if @idea.save
    redirect_to ideas_path, notice: "Your idea was created successfully."
  else
  flash.now[:error] = "PLease correct the form"
    render :new
  end
  end

  def show
    @idea = Idea.find(params[:idea_id] || params[:id])
    @comment=Comment.new
    @comments=@idea.comments.ordered_by_creation
end

  def edit
    
  end

  def new
    @idea = Idea.new
  end

  def destroy
      @idea.destroy
    redirect_to ideas_path, notice: "Comment deleted successfully"
  end

  def update
      if @idea.update_attributes(idea_attributes)
    redirect_to @idea, notice: "Idea updated successfully"
  else
    flash.now[:error] = "Couldn't update!"
    render :edit
  end
end

  private


     def find_idea
    #@idea = Idea.find(params[:idea_id] || params[:id])
    # @question = current_user.questions.find(params[:question_id] || params[:id])
    @idea= current_user.ideas.find_by_id(params[:id])
    redirect_to root_path, alert: "Access Denied" unless @idea
  end

  def idea_attributes
     params.require(:idea).permit([:title, :description])
  end

end
