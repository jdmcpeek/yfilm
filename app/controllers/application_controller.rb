class ApplicationController < ActionController::Base
  # allows more perameters

# A Devise before_action. 'Before_filter' is a deprecated term that means the same thing.
before_action :authenticate_user!

before_action :configure_permitted_parameters, if: :devise_controller?

# Add this before filter to force CAS Authentication on all controllers + actions
# before_filter CASClient::Frameworks::Rails::Filter, :unless => :skip_login?

# Add this before filter to set a local variable for the current user from CAS session
# before_filter :getMe, :unless => :skip_login?

# before_filter :getInterest, :unless => :skip_login?


 # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
 
# And their protected methods
protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :fname, :bio, :college, :year, :email, :interests, :password, :password_confirmation) }
 end

  # getMe should be refactored out. We should be able to create users the normal way, because now there is a difference between signing in and signing up


# def getInterest
#  	@interest = Interest.find_or_create_by_user_id(@me.id)
# end
 
# hack for skip_before_filter with CAS
# overwrite this method (with 'true') in any controller you want to skip CAS authentication
def skip_login? 
  false 
end

  #must define a new signed in method using Devise
# def user_signed_in?
# 	if session[:cas_user].nil? 
# 	    return false
# 	else
# 		return true
# 	end
# end

# def current_user #as inspired by Loide
# 	@current_user = User.find_by(netid: session[:cas_user]).id
# end

end
