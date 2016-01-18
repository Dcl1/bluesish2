class AddIFrameSourceToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :iFrame_Source, :string
  end
end
