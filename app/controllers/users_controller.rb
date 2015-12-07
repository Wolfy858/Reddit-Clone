class UsersController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]
  before_action :validate_user_permissions, only: [:show, :edit, :update]

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end

  def validate_user_permissions
    render json: "You cannot access that user's page" unless params[:id].to_i == current_user.id
  end

end
