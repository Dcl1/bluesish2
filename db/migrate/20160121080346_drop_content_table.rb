class DropContentTable < ActiveRecord::Migration
  def change
  	drop_table :contents
  end
end
