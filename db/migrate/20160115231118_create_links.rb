class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :source
      t.string :img_source
      t.string :title

      t.timestamps null: false
    end
  end
end
