Rails.application.routes.draw do

  get '/manager-admin/login'  => 'admin#login'
  post '/manager-admin/login'  => 'admin#login'
  get '/manager-admin/logout'  => 'admin#logout'
  
  resources :reviews, path: '/manager-admin/reviews'
  resources :categories, path: '/manager-admin/categories'
  resources :users, path: '/manager-admin/users'
  resources :sub_categories, path: '/manager-admin/sub-categories'
  
  # You can have the root of your site routed with "root"
  root 'front#index'
  get '/category/:categorySlug'  => 'front#categories'
  
  get '/review/search'  => 'front#search'
  get '/:categorySlug/:subCategorySlug' => 'front#subCategories'
  
  
  get '/:reviewSlug'  => 'front#reviewDetails'
  get '/go/offer/:id'  => 'front#go'
  
  
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
