class CommentsController < ApplicationController
    def new
       @idea = Idea.find_by_id(params[:idea_id])
       @comment = @idea.reviews.build
    end 

    def index
    end 

    private

    def set_idea

    end 

end
