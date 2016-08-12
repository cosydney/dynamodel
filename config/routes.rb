Rails.application.routes.draw do

  get 'photo_shootings/show'

  get 'photo_shootings/new'

  get 'photo_shootings/create'

  get 'photo_shootings/destroy'

  get 'photo_shootings/edit'

  get 'photo_shootings/update'

  devise_for :users,
          controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'pages#home'


  resources :mannequins, only: [:show, :index] do
    resources :attachinary_files, :path => "photos"
  end
  # change resources to sg!, the mannequin con only update itself, not other mannequins
  resource :mannequin, only: [:edit, :update]
  resources :clients, only: [:new, :create, :show, :edit, :update] do
    resource :photo_shooting, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  get "/page/mannequin/women" => "pages#women"
  get "/page/mannequin/men" => "pages#men"
  get "page/contact" => 'pages#contact'

  mount Attachinary::Engine => "/attachinary"

end
