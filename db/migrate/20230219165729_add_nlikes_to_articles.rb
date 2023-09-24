class AddNlikesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :nlikes, :integer
  end
end
