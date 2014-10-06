class CreateIdeaDetails < ActiveRecord::Migration
  def change
    create_table :idea_details do |t|
      t.text :notes
      t.references :idea, index: true

      t.timestamps
    end
  end
end
