class SubsController < ApplicationController

  before_action :require_current_user!, except: [:index, :show]
  before_action :validate_moderator_status!, only: [:edit, :update]

  def index
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save!
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.save
      redirect_to sub_url
    else
      render :edit
    end
  end



  private

  def sub_params
    params.require(:sub).permit(:name, :description, :moderator)
  end

  def validate_moderator_status!
    subreddit = Sub.find(params[:id])
    unless current_user.subs.include?(subreddit)
      flash.now[:errors] = "You must be the moderator of this subreddit to edit it."
      redirect_to subs_url
    end
  end

end
