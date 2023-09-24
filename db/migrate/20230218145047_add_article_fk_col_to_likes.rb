class AddArticleFkColToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :article, foreign_key: true
  end
end
