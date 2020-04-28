class Idea < ApplicationRecord
  belongs_to :type
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  accepts_nested_attributes_for :type 

  scope :order_by_rating, -> {joins(:comments).group(:id).order('avg(rating)')}

  validates :title, presence: true
  validates :description, presence: true
  validates :type, presence: true

 def self.alpha
  order(:title)
 end 

 
end
