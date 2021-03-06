class IdeasController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_idea, only: [:show, :edit, :destroy]

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
    end 

    def index
        @idea = Idea.all
        @idea.order_by_rating.includes(:type)
    end

    def destroy
        @idea.destroy
        redirect_to ideas_path
      end

      def edit
        redirect_to idea_path if !@idea || @idea.user != current_user
        @idea.build_type if !@idea.type
      end
    
      def update
         @idea = Idea.find_by(id: params[:id])
         redirect_to ideas_path if !@idea || @idea.user != current_user
        if @idea.update(idea_params)
          redirect_to idea_path(@idea)
        else
          render :edit
        end
      end

      def titles 
        @idea = Idea.all.alpha
      end

    private

    def set_idea
      @idea = Idea.find_by_id(params[:id])
    end 

    def idea_params
        params.require(:idea).permit(:title, :description, :type_id, type_attributes: [:name])
    end 
end
