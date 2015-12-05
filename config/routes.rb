Rails.application.routes.draw do

  resource :user
  resource :session, only: [:create, :destroy, :new]
end
