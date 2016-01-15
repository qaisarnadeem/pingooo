Rails.application.routes.draw do
  resources :pingoo_configurations ,:path => 'configurations'
  resources :game_pictures
  get 'main/get_all_countries'
  get 'main/get_prize_categories'
  get "game_pictures/:attachment/:id/:style/:filename" => "games#get_pictures"
  resources :users ,:only=>[:create,:update]
  resources :suggestions
  resources :prize_redemptions
  resources :prize_redemptions
  resources :prize_categories
  resources :games ,:only=>[:new,:create,:update,:destroy] do
    collection do
      get :today_game
    end

  end
  resources :gameplays
  resources :country_specific_prizes
  resources :suggestions
  resources :gameplays
  resources :country_specific_prizes
  resources :prize_categories
  resources :games
  resources :users
  Rails.application.routes.draw do
  resources :pingoo_configurations
  resources :game_pictures
    devise_for :admin_users, controllers: {
        sessions: 'admin_users/sessions',
        registrations: 'admin_users/registrations',
        passwords: 'admin_users/passwords'
    }
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'games#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
