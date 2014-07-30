class UsersController < ApplicationController
  
  def index 
  end

  def new #will need landing page  
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit #edit that particular user
    
  end

  def update
    @user = User.find(params[:id])
    @interest.update(interest_params)
    @user.update(me_params)
    redirect_to user_path
  end

  def search

  end

  def show
    @user = User.find(params[:id])
    @interest = Interest.find_by(user_id: @user.id)
    @attributes = Interest.column_names
    @attributes.reject! {|item| item =~ /id|user_id|updated_at|created_at/ }
  end


  	private

  		def me_params
  			params.require(:user).permit( :name, :fname, :lname, :college, :year, 
                                      :email, :college, :bio, :netid, :image, :password, :password_confirmation )
  		end

      def interest_params
        params.require(:interest).permit(:acting, :directing, :camerawork, :cinematography, :costumes, :sound, :editing)
      end
end
