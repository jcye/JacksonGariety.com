class AdjustQuotes < ActiveRecord::Migration
  def change
    remove_column :quotes, :title
    add_column :quotes, :author, :string
  end
end
