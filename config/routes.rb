Assignments::Application.routes.draw do

  get "welcome/index"

  get 'source_codes/:id/approve' => 'source_codes#approve', as: :approve
  get 'source_codes/:id/reject' => 'source_codes#reject', as: :reject

  get '/home' => 'home#index', as: :home
  root :to => 'welcome#index'

  get "uploader/create"

  mount Ckeditor::Engine => '/ckeditor'

  get '/login' => 'sessions#new', as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  

  get '/projects/:project_id/contributions' => 'projects#contributions', as: :user_contributions 
  get '/assignments/start/:assignment_id' => 'submissions#start', as: :start_assignment 
  get '/projects/:project_id/start' => 'projects#participate', as: :start_project 
  get '/projects/:project_id/add_contribution' => 'projects#add_contribution', as: :add_contribution

  get '/projects/my_projects' => 'projects#my_projects', as: :my_projects

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :users
  resources :profiles
  resources :contributions do 
    resources :comments
    resources :source_codes
    resources :attachments
  end

  resources :source_codes do
    resources :comments
  end
  resources :sessions
  resources :assignments do
    resources :attachments
  end

  resources :projects do
    resources :comments           # Each submission has_many comments
    resources :attachments        # Each submission has_many attachments
    resources :source_codes       # Each submission has_many source_codes
  end

  resources :submissions do
    resources :comments           # Each submission has_many comments
    resources :attachments        # Each submission has_many attachments
    resources :source_codes       # Each submission has_many source_codes
  end
  

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
