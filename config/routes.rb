Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :mannequins do
    resources :photos
  end

  resources :clients, only: [:new, :create, :show, :edit, :update]

#----------------------------------------ROUTES---------------------------------------------
#                     Prefix Verb   URI Pattern                                         Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                           devise/sessions#destroy
#            user_password POST   /users/password(.:format)                           devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                      devise/passwords#edit
#                          PATCH  /users/password(.:format)                           devise/passwords#update
#                          PUT    /users/password(.:format)                           devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                             devise/registrations#cancel
#        user_registration POST   /users(.:format)                                    devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                            devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                               devise/registrations#edit
#                          PATCH  /users(.:format)                                    devise/registrations#update
#                          PUT    /users(.:format)                                    devise/registrations#update
#                          DELETE /users(.:format)                                    devise/registrations#destroy
#                     root GET    /                                                   pages#home
#         mannequin_photos GET    /mannequins/:mannequin_id/photos(.:format)          photos#index
#                          POST   /mannequins/:mannequin_id/photos(.:format)          photos#create
#      new_mannequin_photo GET    /mannequins/:mannequin_id/photos/new(.:format)      photos#new
#     edit_mannequin_photo GET    /mannequins/:mannequin_id/photos/:id/edit(.:format) photos#edit
#          mannequin_photo GET    /mannequins/:mannequin_id/photos/:id(.:format)      photos#show
#                          PATCH  /mannequins/:mannequin_id/photos/:id(.:format)      photos#update
#                          PUT    /mannequins/:mannequin_id/photos/:id(.:format)      photos#update
#                          DELETE /mannequins/:mannequin_id/photos/:id(.:format)      photos#destroy
#               mannequins GET    /mannequins(.:format)                               mannequins#index
#                          POST   /mannequins(.:format)                               mannequins#create
#            new_mannequin GET    /mannequins/new(.:format)                           mannequins#new
#           edit_mannequin GET    /mannequins/:id/edit(.:format)                      mannequins#edit
#                mannequin GET    /mannequins/:id(.:format)                           mannequins#show
#                          PATCH  /mannequins/:id(.:format)                           mannequins#update
#                          PUT    /mannequins/:id(.:format)                           mannequins#update
#                          DELETE /mannequins/:id(.:format)                           mannequins#destroy
#                  clients POST   /clients(.:format)                                  clients#create
#               new_client GET    /clients/new(.:format)                              clients#new
#              edit_client GET    /clients/:id/edit(.:format)                         clients#edit
#                   client GET    /clients/:id(.:format)                              clients#show
#                          PATCH  /clients/:id(.:format)                              clients#update
#                          PUT    /clients/:id(.:format)                              clients#update
# ---------------------------------------------------------------------------------------------------------------------------

end
