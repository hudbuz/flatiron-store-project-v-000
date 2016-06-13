class AddtitletoItems < ActiveRecord::Migration
  def change
    remove_column :items, :name
    add_column :items, :title, :string
  end
end
