class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :destroy]

def index
        if params[:idea_id]
            if set_idea
            @comments = @idea.comments
            else
              flash[:message] = "That idea doesn't exist. "
              redirect_to ideas_path
            end 
        else 
        @comments = Comment.all
        end 
    end 
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

    def destroy
        
        @comment.destroy
        redirect_to comment_path, :notice => "Your post has been deleted."
      end

      def edit
      end
    
      def update
        if @comment.update(comment_params)
          redirect_to comment_path(@comment)
        else
          render :edit
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
