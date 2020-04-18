class Type < ApplicationRecord
    has_many :ideas

    validates :name, uniqueness: true

    def self.alpha
        order(:type)
       end 
end
