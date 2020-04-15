class IdeasController < ApplicationController

    def new
        @idea = Idea.new
        @idea.build_type
    end 


    private

    def idea_params
        params.require(:idea).permit(:title, :description, :type_id, brand_attributes: [:name])
    end 
end
