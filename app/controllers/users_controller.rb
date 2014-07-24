class UsersController < ApplicationController
  
  def index 
  end

  def new #will need landing page  
    @interest = @me.build_interest
    if @me.email && @me.college && @me.year
      redirect_to user_path(@me.id)
    end
  end

  def edit #edit that particular user
    
  end

  def update
    @me = User.find(params[:id])
    @interest = @me.build_interest(interest_params).save
    @me.update(me_params)
    redirect_to user_path
  end

  def search

  end

  def show
    @me = User.find(params[:id])
    @attributes = Interest.column_names
    @attributes.reject! {|item| item =~ /id|user_id|updated_at|created_at/ }
  end


  	private

  		def me_params
  			params.require(:user).permit( :fname, :lname, :college, :year, 
                                      :email, :college, :bio, :netid, :image )
  		end

      def interest_params
        params.require(:interest).permit(:acting, :directing, :camerawork, :cinematography, :costumes, :sound, :editing)
      end
end
