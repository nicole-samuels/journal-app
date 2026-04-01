class ProjectsController < ApplicationController
before_action :find_pattern

    def new
        @project = @pattern.projects.build
    end

    def create
        @project = @pattern.projects.build(project_params)

        if @project.save 
            redirect_to pattern_path(@pattern),
            notice: 'Project was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
  @pattern = Pattern.find(params[:pattern_id])
  @project = @pattern.projects.find_by(id: params[:id])

  if @project.nil?
    redirect_to pattern_path(@pattern), alert: "Project not found."
  end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update 
        @project = Project.find(params[:id])
        if @project.update(project_params) 
            redirect_to pattern_project_path, notice: 'Project updated!'
        else
            render :edit, status: :unprocessable_entity
        end
    end

        # DELETE /project/1
    def destroy
  @pattern = Pattern.find(params[:pattern_id])
  @project = @pattern.projects.find(params[:id])
  
  @project.destroy
  
  # Redirect back to the Pattern's show page, not the deleted project's page
  redirect_to pattern_path(@pattern), notice: "Attempt was successfully deleted.", status: :see_other
    end


    private

    def project_params
        params.require(:project).permit(:status,
             :yarn_used, :yarn_weight, :yarn_price, :yarn_quantity, :needle_size, :garment_size, :start_date, :finish_date, :project_difficulty_review, :yarn_softness_review, :pattern_clarity_review, :comment, :purchase_link, photo: [])
    end

    def find_pattern
        @pattern = Pattern.find(params[:pattern_id])
    end
end
