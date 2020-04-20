class User < ApplicationRecord
    has_many :comments
    has_many :commented_ideas, through: :reviews, source: :idea
    has_many :ideas

    validates :email, uniqueness: true
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
