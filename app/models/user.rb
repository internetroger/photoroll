class User < ApplicationRecord
    has_many :posts
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    has_secure_password
end
