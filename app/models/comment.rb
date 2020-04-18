class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :content, presence: true 
  validates :rat ing, presence: true, numericality: {only_integer: true, greater_then_or_equal_to: 0, less_than: 6}
end
