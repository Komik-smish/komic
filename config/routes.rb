Rails.application.routes.draw do

  root to: 'images#index'

  get '/accessories', to: "accessories#jd"

  get '/strip/:id', to: 'strips#show'

  post '/strip/:name/:image_id', to: 'strips#create_strip'

  get '/images/edits', to: 'images#ios_images'

  resources :images
  resources :accessories

  get 'user/:id', to: 'users#show'
  post 'users/signup', to: 'users#create'
  post 'users/login', to: 'users#login'
  get 'users', to: 'users#index'


  delete 'users/:id', to: 'users#destroy'
  # get 'assets', to: 'assets#index'
  # post 'assets', to: 'assets#create', as: 'create_assets'

  # delete 'assets/:asset_url', to: 'assets#destroy'


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
