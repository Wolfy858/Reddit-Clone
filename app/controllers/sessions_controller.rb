class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password]
    )

    if user.nil?
      render json: "Invalid credentials"
    else
      render json: "Welcome back, #{user.username}!"
    end
  end

  def new
    render :new
  end

  def destroy

  end

end
