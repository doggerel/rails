Hack::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :roles

  resources :comments

  get "archives/index"
  get "posts/post_by_title"
  get "users/followers"
  

  resources :titles


  get "autocomplete/title"


  devise_for :users
  resources :posts
  resources :users
  resources :titles, :only =>[:index]
  resources :autocomplete
  resources :routes
  match 'posts/:id' =>'posts#show', :as=> :blog
  match 'posts/user_posts_all/:id' => 'posts#user_posts_all', :as => :inspected_user_posts
  match 'posts/post_by_title/:id' =>'posts#post_by_title', :as => :posted_title
  match 'posts/return_post/:id' =>"posts#return_post", :as => :full_post
  match 'users/followers/:id' => "users#followers", :as => :followers

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  resources :users do
    member do
      get :following, :followers
    end
  end

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
   root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
