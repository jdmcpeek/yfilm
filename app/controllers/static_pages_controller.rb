class StaticPagesController < ApplicationController
 
  skip_before_action :authenticate_user!


  def home
    @me = current_user
  end

  def screenings
    @me = current_user
  end

  def show
    @me = current_user
    @project = Project.find(params[:id])
    @producer_id = Role.find_by(project_id: @project.id).user_id
    @producer = User.find_by(id: @producer_id)
  end


  
end


