Usport::Application.routes.draw do

  resources :sports

  namespace :admin do
    resources :teams
  end

  resources :cards

  devise_for :investors, :controllers => { :sessions => "investors/sessions", :registrations => "investors/registrations", :passwords => "investors/passwords" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => 'users/sessions' }

  resources :feed_entries do
    resources :comments
  end

  get "admin/approve_investors"
  get "admin" => 'admin#approve_investors'
  resources :images

  get "home/index"
  get "home/hacked_sign_in"
  get "home/dashboard"
  get "home/dashboardtest"
  get "home/cards"
  get "home/player"
  get "home/landing"
  get "home/teams"
  get "home/create_card"
  get "home/research"
  get "home/events"
  post "home/comment"
  post "home/feed_entry"
  post "home/player_partial"
  get "home/feed_data"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#dashboard'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get "player/:card_id" => 'home#player'
  get "players" => 'home#player'
  get 'dashboard' => 'home#dashboard'
  get 'myhome' => 'home#dashboard'
  get 'my_home' => 'home#dashboard'
  get "teams" => 'home#teams'
  get 'events' => 'home#events'
  get 'research' => 'home#research'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
