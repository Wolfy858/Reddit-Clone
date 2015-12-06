class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      render json: "Invalid credentials"
    else
      login!(@user)
      redirect_to user_url
    end
  end

  def new
    render :new
  end

  def destroy

  end

end
