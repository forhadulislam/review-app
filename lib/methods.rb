def checkadmin
    if !session[:admin_id]
        redirect_to :controller => "admin", :action => "login"
    end
end