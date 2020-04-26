class User < ApplicationRecord
    has_many :comments
    has_many :commented_ideas, through: :comments, source: :idea
    has_many :ideas, dependent: :destroy

    validates :first_name,  presence: true
    validates :first_name,  presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    has_secure_password

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:username => auth_hash["info"]["nickname"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end 
    end 


end
