ActionController::Routing::Routes.draw do |map|
 
  map.resources :users do |user|
     user.resources :qualifications
     user.resources :histories
  end   
  map.resources :password_resets, :only => [ :new, :create, :edit, :update ]
  map.resources :sectors
  map.resources :categories
  map.resources :techniques
  map.resources :bodies
  map.resources :user_sessions
  map.resources :posts
  map.resources :sessions
  map.resources :levels
  
  map.with_options :controller => 'contact' do |contact|
    contact.contact '/contact',
      :action => 'index',
      :conditions => { :method => :get }

    contact.contact '/contact',
      :action => 'create',
      :conditions => { :method => :post }
  end
  
    
  map.terms "terms", :controller => "info", :action => "terms"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.login "login", :controller => "user_sessions", :action => "new"
   map.adminlogin 'adminlogin', :controller => 'sessions', :action => 'new'
   map.adminlogout 'adminlogout', :controller => 'sessions', :action => 'destroy'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "info"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
