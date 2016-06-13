class FixCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :name
    add_column :categories, :title, :string
  end
end
