class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :source
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
