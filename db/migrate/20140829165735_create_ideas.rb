class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :view_count

      t.timestamps
    end
    add_index :ideas, :title
  end
end
