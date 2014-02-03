CharityHost::Application.routes.draw do

  #posts  
  get 'charity/:id/posts/new', to: "post#new" , as: "new_post"
  post 'charity/:id/posts/create', to: "post#create" , as: "create_new_post"
  get 'charity/:id/posts/edit/:post_id', to: "post#edit", as: "edit_post"
  patch 'charity/:id/posts/update/:post_id', to: "post#update" , as: "update_post"

  #appearance
  match "charity/:id/appearance/:action", to: 'appearance', as: "appearance", via: [:get, :patch]
 
  #communication
  match "charity/:id/communication/:action", to: 'communication', as: "communication", via: [:get, :post]

  #upload 
  match "charity/:id/upload/:action", to: 'upload', as: "upload", via: [:get, :post]

  get '/charity/:id/index', to: 'charity#show'
  match '/charity/:id/:action', to: 'charity', as: 'charity', via: [:get, :post]
  resources :charity, :path => 'charity'

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
