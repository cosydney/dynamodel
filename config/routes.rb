Rails.application.routes.draw do

  devise_for :users,
          controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'pages#home'


  resources :mannequins, only: [:show, :index] do
    resources :attachinary_files, :path => "photos"
  end
  # change resources to sg!, the mannequin con only update itself, not other mannequins
  resource :mannequin, only: [:edit, :update]
  resources :clients, only: [:new, :create, :show, :edit, :update]

  get "/page/mannequin/women" => "pages#women"
  get "/page/mannequin/men" => "pages#men"
  get "/page/mannequin/search" => "pages#search"
  get "page/contact" => 'pages#contact'

  mount Attachinary::Engine => "/attachinary"

end
