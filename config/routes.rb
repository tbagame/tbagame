Tbagame::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  root :to => 'index#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  match 'check_name', to: 'accounts#check_name'
  resources :challenges
  resources :appointments
  resources :teams
  resources :maps
  match 'register',:to => 'register#new'
  match 'reg',:to => 'register#create'
  #resources :register
  match 'login',:to => 'sessions#new'
  match 'logout',:to => 'sessions#logout'
  resources :sessions

  #match 'signin',:to => 'sessions#create'
  namespace :center do
    match 'index', to: 'home#index'
    match 'show', to: 'home#show'
    match 'user', to: 'home#user'
    match 'spot', to: 'home#spot'
    match 'rel', to: 'user_team_rels#rel'

    match 'challenges/join', to: 'challenges#join'
    resources :challenges


  end

  namespace :manage do
    match 'logout', to: 'sessions#logout', :via => [:get]
    match 'login', to: 'sessions#new', :via => [:get]


    resource :sessions

    root :to => 'sessions#new'

    match 'admins/pwd', to: 'admins#pwd'
    match 'admins/reset_password', to: 'admins#reset_password'
    resources :admins
    match 'users/users_json', to: 'users#users_json'
    resources :users do
      resources :accounts
      resources :user_team_rels
    end

    resources :teams do
      resources :user_team_rels
    end
    resources :players
    resources :messages
    match 'invites/invite_status', to: 'invites#invite_status'
    resources :invites
    resources :play_statuses
    resource :challenges
  end

  mount V1::API => '/'

end
