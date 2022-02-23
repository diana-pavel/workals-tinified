class AddLinksToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :title, :string
    add_column :users, :link, :string
  end
end
