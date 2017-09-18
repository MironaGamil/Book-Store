module SessionsHelper
	def log_in
    	session[:admin] = true
  	end

  	def logged_in?
		session[:admin]
	end

	def log_out
		session.delete(:admin)
	end	    
end
