class PatternsController < ApplicationController

    # GET /patterns
    def index
        @patterns = Pattern.all
    end 

    # GET /pattern
    def show
        @pattern = Pattern.find(params[:id])
    end

    # 
    def new
        @pattern = Pattern.new()
    end

    # POST /patterns/new
    def create
        @pattern = Pattern.new(pattern_params)
        if @pattern.save
            redirect_to root_url, 
            notice: 'Pattern was successfully created.'
        else
            render :new
        end
    end

    # DELETE /patterns/1
    def destroy
       Pattern.find(params[:id]).destroy
       redirect_to root_url
    end

    def edit
        @pattern = Pattern.find(params[:id])
    end

    def update 
        @pattern = Pattern.find(params[:id])
        if @pattern.update(pattern_params) # Update with validated params
            redirect_to @pattern, notice: 'Item updated!'
        else
            render :edit, status: :unprocessable_entity
        end
    end


    private

    def pattern_params
        params.require(:pattern).permit(:pattern_name, :description, :item_category, :level, :pattern_pdf)
    end

end
