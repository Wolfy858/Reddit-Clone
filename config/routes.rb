Rails.application.routes.draw do

  resources :users
  resource :session, only: [:create, :destroy, :new]
  resources :subs, only: [:create, :new, :index, :show, :edit, :update]
end
