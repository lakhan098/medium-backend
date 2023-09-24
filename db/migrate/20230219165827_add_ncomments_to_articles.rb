class AddNcommentsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :ncomments, :integer
  end
end
