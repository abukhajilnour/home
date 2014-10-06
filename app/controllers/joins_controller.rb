class JoinsController < ApplicationController
    before_action :authenticate_user!
  before_action :find_idea

  def create
    @join = @idea.joins.new
    @join.user = current_user
    if @join.save
      redirect_to @idea,notice:"joined"
    else
      redirect_to @idea, alert:"can't joined"
  end
end

  def destroy
      @join = current_user.joins.find params[:id]
    if @join.destroy
      redirect_to @idea,notice:"unjoin"
    else
      redirect_to @idea,alert:"can't unjoin"
    end
  end


 private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
