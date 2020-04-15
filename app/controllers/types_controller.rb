class TypesController < ApplicationController

    def new
        @type = Type.new
    end 
end
