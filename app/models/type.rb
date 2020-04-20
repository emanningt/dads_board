class Type < ApplicationRecord
    has_many :ideas



    def self.alpha
        order(:type)
       end 
       
end
