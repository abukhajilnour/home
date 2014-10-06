class RemarksController < ApplicationController

def create
  @post = Post.find(params[:post_id])
    @remark = @post.remarks.new(params.require(:remark).permit[:body])
    if @remark.save
      redirect_to @post, notice: "Comment created successfully"
    else
      render "/posts/show"
    end
end
def index
render text:"kjhjk,"
  end
end
