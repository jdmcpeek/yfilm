class Users::RegistrationsController < Devise::RegistrationsController
  def new

  	super
    	@me = User.new
    	# @interest = @me.build_interest

  end

  def create
    super
     	@me = User.create(me_params)
      # using one of the handy has_one associations to directly correlate the two objects
   	 	# @interest = @me.create_interest(interest_params)
   	 	
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





