class Idea < ApplicationRecord
  belongs_to :type
  belongs_to :user

  has_many :comments
  has_many :users, through: :reviews
end
