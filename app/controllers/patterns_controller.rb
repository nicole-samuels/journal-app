class PatternsController < ApplicationController

    def index
        @patterns = Pattern.all
    end 

    def new
        @pattern = Pattern.new()
    end

    def create
        @pattern = Pattern.new(pattern_params)
        if @pattern.save
            redirect_to root_url, 
            notice: 'Pattern was successfully created.'
        else
            render :new
        end
    end

    def destroy
       Pattern.find(params[:id]).destroy
       redirect_to root_url
    end

    private

    def pattern_params
        params.require(:pattern).permit(:pattern_name, :description, :item_category, :level)
    end

end
