class User < ApplicationRecord
    has_secure_password

    has_many :articles, dependent: :destroy
    #validates
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    # validates :password, length: {minimum: 6}, if: {new_record || !password.nil}

    
    
end
