class UsersController < ApplicationController
  
  def index 
  end

  def new #will need landing page  
    # if @me.email && @me.college && @me.year
    #   redirect_to user_path(@me.id)
    # end
    @user = User.new
    @interest = @user.build_interest

  end

  def create
    @user = User.create(me_params)
      # using one of the handy has_one associations to directly correlate the two objects
    @interest = @user.create_interest(interest_params)
  end

  def edit #edit that particular user
    @me = current_user
    @interest = @me.create_interest
  end

  def update
    @interest = current_user.interest
    @interest.update(interest_params)
    current_user.update(me_params)
    redirect_to user_path
  end

  def search

  end

  def show
    @user = User.find(params[:id])
    @interest = @user.interest
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
