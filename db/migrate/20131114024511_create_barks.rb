class CreateBarks < ActiveRecord::Migration
  def change
    create_table :barks do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
