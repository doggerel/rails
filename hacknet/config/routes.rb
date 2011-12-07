Hacknet::Application.routes.draw do
  devise_for :users

  resources :finds
  resource :identity
  resources :messages
  match '/chat' => 'demo#index'
  match '/test' => 'demo#test_index'
  match '/pusher/auth' => 'pusher#auth'

  get "posts/new"

  get "posts/show"

  get "posts/index"
  get "autocomplete/users"

  get "posts/update"

  get "posts/destroy"

  resources :users
  resource :finds
  resources :sessions
  resources :autocomplete

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
     match 'autocomplete/users/:term' => 'autocomplete#users'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
     match 'sessions/new' => 'sessions#new', :as => :signin
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
