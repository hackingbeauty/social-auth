class WeightsController < ApplicationController
  
  def create
    user = User.find_by_email(params["email"])
    if user
      user.update_attributes({:weight => params["weight"]})
    end
    render :nothing => true
  end

  def lookup
    user = User.find_by_email(params["email"])
    if user.weight != nil
      render :json => {:weight => user.weight}
    else
      render :json => {:weight => nil}
    end
  end

end
