class RemoveLikeCountFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :like_count, :integer
  end
end
