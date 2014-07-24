class StaticPagesController < ApplicationController
  
  def skip_login? #skip login for static pages yayaayay!
	 true
  end

  def home
  	getMe
  end

  def screenings
    getMe
  end

  def show
    getMe
    @project = Project.find(params[:id])
    @producer_id = Role.find_by(project_id: @project.id).user_id
    @producer = User.find_by(id: @producer_id)
  end

  def logout
  	reset_session
  	redirect_to "https://secure.its.yale.edu/cas/logout" 
  end
  
end


