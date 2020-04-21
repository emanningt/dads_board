class Idea < ApplicationRecord
  belongs_to :type, dependent: :destroy
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :users, through: :reviews

  accepts_nested_attributes_for :type 

  scope :order_by_rating, -> {joins(:comments).group(:id).order('avg(rating)')}

  validates :title, presence: true,
  validates :description, presence: true
  validates :type, uniqueness: true, presence: true

 def self.alpha
  order(:idea)
 end 

end
