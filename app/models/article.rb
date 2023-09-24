class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :likes # Quiz attribute containing an array of McQuestion objects
    has_many :comments # Quiz attribute containing an array of McQuestion objects
    
end
