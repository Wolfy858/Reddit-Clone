class SubsControllers < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end


end
