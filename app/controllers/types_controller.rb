class TypesController < ApplicationController

    def new
        @type = Type.new
    end 

    def index
        @type = Type.all
    end 

    def destroy
        @type = Type.find(params[:id])
        @type.destroy
        redirect_to types_path, :notice => "Your post has been deleted."
      end
end
