Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'users#index'

  resources :articles, :only =>[:new, :create, :index] do

  end
  resources :users, :only =>[:index, :edit] do
    post :update_profile, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
