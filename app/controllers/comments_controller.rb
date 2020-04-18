class CommentsController < ApplicationController
    def new
       set_idea
       @comment = @idea.comments.build
    end 

    def create
        @comment = current_user.comments.build(comment_params)
       if @comment.save
        redirect_to comment_path(@comment)
       else
        render :new
       end 
    end     

    def show
        @comment = Comment.find_by_id(params[:id])
    end 

    def index
        if set_idea
            @comments = @idea.comments
        else 
        @comments = Comment.all
        end 
    end 

    private

    def set_idea
        @idea = Idea.find_by_id(params[:idea_id])
    end 

    def comment_params
        params.require(:comment).permit(:rating, :content, :idea_id)
    end 

end
