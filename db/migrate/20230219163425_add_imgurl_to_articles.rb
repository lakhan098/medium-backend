class AddImgurlToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :imgurl, :string
  end
end
