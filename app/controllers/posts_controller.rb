class PostsController < ApplicationController

  def index
    @posts=Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully"
    else
      render:new
    end
  end

  def show
    @post = Post.find(params[:id])
    @remark=Remark.new
  end

  private

  def post_params
    Post.new(params.require(:post).permit([:title, :description]))
  end
end


<% if flash[:notice] %>
    <div class="alert alert-success" >
     <%= flash[:notice] %>
    </div>
    <% elsif flash[:alert] %>
    <div class="alert alert-danger" >
      <%= flash[:alert] %>
  <% end %>