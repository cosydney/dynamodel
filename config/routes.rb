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

  mount Attachinary::Engine => "/attachinary"

end
