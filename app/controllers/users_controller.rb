class UsersController < ApplicationController
  
  def index 
  end

  def new #will need landing page  

    @user = User.new
  
  end

  def edit #edit that particular user
    
  end

  def update
    @me = User.find(params[:id])
    @interest.update(interest_params)
    @me.update(me_params)
    redirect_to user_path
  end

  def search

  end

  def show
    @me = User.find(params[:id])
    @interest = Interest.find_by(user_id: @me.id)
    @attributes = Interest.column_names
    @attributes.reject! {|item| item =~ /id|user_id|updated_at|created_at/ }
  end


  	private

  		def me_params
  			params.require(:user).permit( :name, :fname, :lname, :college, :year, 
                                      :email, :college, :bio, :netid, :image )
  		end

      def interest_params
        params.require(:interest).permit(:acting, :directing, :camerawork, :cinematography, :costumes, :sound, :editing)
      end
end
