class AddLinksToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :title, :string
    add_column :companies, :link, :string
  end
end
