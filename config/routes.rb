ImportContact::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resource 'invites'
  match "invites" => "Invites#index"
  get "/contacts/failure" => "Invites#failure"
  get "/oauth2callback" =>  "Invites#contacts_callback"
  match "/contacts/:importer/callback" => "Invites#contacts_callback"

  post "invite_friends", :to => "invites#invite_friends", :as => :invite_friends
  post "send_message_twitter", :to => "invites#send_message_twitter", :as => :send_message_twitter

  match 'auth/twitter/callback', :to => 'invites#twitter_callback'
  match 'invite/twitter_friends', :to => 'invites#invite_twitter_friend'

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
   root :to => 'Invites#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
