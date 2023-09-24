class Category < ApplicationRecord
    has_many(
        :articles, # Quiz attribute containing an array of McQuestion objects
        class_name: 'Article', # datatype of attribute
        foreign_key: 'category_id', # name of column containing FK in other table
        inverse_of: :category, # attribute on other side of association (parent Quiz object)
        dependent: :destroy # if a quiz is destroyed, also destroy all of its questions
      )
      
    
end
