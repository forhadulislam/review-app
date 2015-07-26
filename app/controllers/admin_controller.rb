class AdminController < ApplicationController
  layout 'admin'
  def login
      if request.method() == 'POST'
        @email = params[:email]
        @password = params[:password]
        
        @checkUser = User.find_by email: @email, password: @password
        
        if @checkUser
            session[:admin_id] = @checkUser.id
            redirect_to reviews_url
        else
            @user = "User Not Found"
        end
      else
        if session[:admin_id]
            redirect_to reviews_url
        end
      end
  end

  def logout
      reset_session
      redirect_to :controller => "admin", :action => "login"
  end
end
