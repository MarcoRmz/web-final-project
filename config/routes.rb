Rails.application.routes.draw do

  get 'characters/highscores'
  get 'characters/show/:id', to: 'characters#show'
  post 'characters/follow/:id', to: 'characters#follow'
  post 'characters/hide/', to: 'characters#toggle_hide'
  get 'search/:name', to: 'characters#search'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/500.html')
  get 'signout', to: 'sessions#destroy', as: 'signout'
 
  resources :sessions, only: [:create, :destroy]
  
  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/about', to: 'welcome#about_us'
  get '/contact', to: 'welcome#contact_us'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
