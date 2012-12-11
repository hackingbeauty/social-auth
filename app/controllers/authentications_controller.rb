class AuthenticationsController < ApplicationController
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth["provider"],omniauth["uid"])
    if authentication
      redirect_to users_show_path
    else
      user = User.new
      user.authentications.build(:provider => omniauth["provider"], :uid => omniauth["uid"])

      user.name = omniauth["info"]["name"]
      user.email = omniauth["info"]["email"]
      user.save!
      redirect_to users_show_path
    end
    session[:name] = omniauth["info"]["name"]
    session[:uid] = omniauth["uid"]
    session[:provider] = omniauth["provider"]
    session[:avatar] = omniauth["info"]["image"]
  end

  def index
  end

  def destroy
  end

end
