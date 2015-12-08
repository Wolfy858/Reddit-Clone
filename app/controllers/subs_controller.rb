class SubsControllers < ApplicationController

  def index
  end

  def show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url
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

end
