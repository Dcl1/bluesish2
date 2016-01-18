class AddAttributesToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :smaller_thumbnail, :string
  	add_column :videos, :larger_thumbnail, :string
  	add_column :videos, :date, :datetime
  	add_column :videos, :provider, :string
  	add_column :videos, :description, :string
  end
end
