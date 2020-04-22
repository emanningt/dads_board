class IdeasController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        @idea = Idea.new
        @idea.build_type
    end  

    def create
        @idea = Idea.new(idea_params)
        @idea.user_id = session[:user_id]
        if @idea.save
            redirect_to idea_path(@idea)
        else 
            render :new
        end 
    end 

    def show
        @idea = Idea.find(params[:id])
    end 

    def index
        @idea = Idea.all
        @idea.order_by_rating.includes(:type)
    end

    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        redirect_to ideas_path, :notice => "Your post has been deleted."
      end

      def edit

      end 

    private

    def idea_params
        params.require(:idea).permit(:title, :description, :type_id, type_attributes: [:name])
    end 
end
