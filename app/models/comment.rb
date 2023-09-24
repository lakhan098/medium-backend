class Comment < ApplicationRecord
    belongs_to(
        :article, # McQuestion attribute of with datatype Quiz
        class_name: 'Article', # datatype of attribute
        foreign_key: 'article_id', # name of column containing FK
        inverse_of: :comments # attribute on other side of association (array containing all McQuestion objects belonging to a quiz)
      )
end
