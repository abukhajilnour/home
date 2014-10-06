class CommentsController < ApplicationController

 before_action :authenticate_user!

   
def create
 
  @idea = Idea.find params[:idea_id]
  @comment = @idea.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      CommentMailer.notify_idea_owner(@comment).deliver
        redirect_to @idea, notice: "Comment created successfully."
    else
      flash.now[:alert] = "Comment cant be saved"
      render "/ideas/show"
    end
  end


    def destroy
      @idea = Idea.find params[:idea_id]
    @comment = @idea.comments.find params[:id]

     if  current_user == @comment.user && @comment.destroy
      redirect_to @idea, notice: "Idea deleted"
    else
      redirect_to @idea, alert: "We had trouble deleting the idea"
    end
  end

    private

  def comment_params
    params.require(:comment).permit([:body])
  end

def find_idea
    @idea = Idea.find(params[:idea_id] || params[:id])
  end
  

end
