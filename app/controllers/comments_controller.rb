class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in


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

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
          flash[:message] = "Comment was not found"
          redirect_to comments_path
        end
      end

    def comment_params
        params.require(:comment).permit(:rating, :content, :idea_id)
    end 

end
