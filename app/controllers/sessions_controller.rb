class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

#class SessionsController < ApplicationController
#  def create
 #   auth = request.env["omniauth.auth"]
  #  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
   # session[:user_id] = user.id
    #redirect_to root_url, :notice => "Signed in!"
 # end

  #def destroy
   # session[:user_id] = nil
    #redirect_to root_url, :notice => "Signed out!"
  #end
#end


