class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_idea

  def create
    @like = @idea.likes.new
    @like.user = current_user
    if @like.save
      redirect_to @idea,notice:"liked"
    else
      redirect_to @idea, alert:"can't liked"
  end
end

  def destroy
@like = current_user.likes.find params[:id]
if @like.destroy
  redirect_to @idea,notice:"unlike"
else
  redirect_to @idea,alert:"can't unlike"
end
  end
 private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
