class Idea < ApplicationRecord
  belongs_to :type
  belongs_to :user
end
