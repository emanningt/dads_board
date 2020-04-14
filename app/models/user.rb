class User < ApplicationRecord
    include ActiveModel::Validations

    has_many :comments
    has_many :commented_ideas, through: :reviews, source: :idea
    has_many :ideas
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
end
