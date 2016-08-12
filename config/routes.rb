Rails.application.routes.draw do

  devise_for :users,
          controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations"}
          # Add controller for registrations
  root to: 'pages#home'


  resources :mannequins, only: [:show, :index] do
    resources :attachinary_files, :path => "photos"
  end
  # change resources to sg!, the mannequin con only update itself, not other mannequins
  resource :mannequin, only: [:edit, :update]

  resource :client, only: [:show, :edit, :update] do
    resource :photo_shooting, only: [:show, :new, :create, :destroy]
  end
  get "/page/mannequin/women" => "pages#women"
  get "/page/mannequin/men" => "pages#men"
  get "/page/mannequin/" => "pages#search"
  get "page/contact" => 'pages#contact'

  mount Attachinary::Engine => "/attachinary"

end
