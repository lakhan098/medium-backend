class AddNameToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :likes, :string
  end
end
