class TypesController < ApplicationController

    def new
        @type = Type.new
    end 

    def index
        @type = Type.all
    end 
end
