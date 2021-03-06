CharityHost::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "settings/index"
  #posts  
  # get 'charity/:id/posts/new', to: "post#new" , as: "new_post"
  # post 'charity/:id/posts/create', to: "post#create" , as: "create_new_post"
  # get 'charity/:id/posts/edit/:post_id', to: "post#edit", as: "edit_post"
  # patch 'charity/:id/posts/update/:post_id', to: "post#update" , as: "update_post"

  #post
  get "charity/:id/post/index", to: 'post#index', as: 'post_index'
  post "charity/:id/post/create", to: 'post#create'
  match "charity/:id/post/:post_id/:action", to: 'post', as: "post", via: [:get, :patch, :delete]

  #comment
  match "charity/:id/post/:post_id/comment/:comment_id/:action", to: 'comment', as: "comment", via: [:get, :patch, :delete]

  #appearance
  match "charity/:id/appearance/:action", to: 'appearance', as: "appearance", via: [:get, :patch]
 
  #settings
  match "charity/:id/settings/:action", to: 'settings', as: "settings", via: [:get, :patch]

  #upload 
  get "uploads/:id/*_", to: 'upload#show'
  match "charity/:id/upload/:action", to: 'upload', as: "upload", via: [:get, :post]

  get '/charity/:id/index', to: 'charity#show'
  post '/charity/check_passcode', to: 'charity#check_passcode'
  match '/charity/:id/:action', to: 'charity', as: 'charity', via: [:get, :post]

  resources :charity, :path => 'charity'

  #override devise
  get '/users/sign_in', to: 'home#index', as: 'new_user_session_path'
  devise_for :users
  root :to => 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
