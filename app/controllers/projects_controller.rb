class ProjectsController < ApplicationController

	def index
		@me = current_user
	end

	def search #must search with both first and last names currently (search bar). Look into inter-model searching
		@movie = Project.where(nil) #creates an anonymous scope
		@movie = @movie.find_project(params[:search]) if params[:search].present?
		@person = User.where(name: params[:search]) if params[:search].present?
	end

	def new
		@me = current_user
		@project = @me.projects.new
	end

	def create
		@me = current_user
		@project = @me.projects.create(project_params)
		redirect_to project_path(@project)
	end

	def show #lots of variables available for refactoring. 
		
		@project = Project.find(params[:id])
		@producer_id = Role.find_by(project_id: @project.id).user_id
		@producer = User.find_by(id: @producer_id)
  		@role = @project.roles.build
  		@audition = @project.auditions.build

		if user_signed_in? && current_user == @producer_id
			@me = current_user
			@project = @me.projects.find(params[:id])	
  			@role = @project.roles.build
  		end
		#NOTE: find_by(params[:id]) doesn't work! @me.projects.find_by(id: params[:id]) OR @me.projects.find(params[:id]) are equivalent syntax.
	end

	def edit
		@project = @me.projects.find(params[:id]) #refactor: create application helper for @project to call before controller functions
	end

	def update 
		@project = @me.projects.find(params[:id])
		@project.update(project_params)
		redirect_to project_path(@project)
	end

	def destroy
		@project = @me.projects.find(params[:id])
		@project.destroy
		redirect_to user_path(current_user)
	end

  private

	def project_params
        params.require(:project).permit(:title, :genre, :description, :dates, :producer, :location, :image, :remote_image_url, :video, :video_html)
    end

end
