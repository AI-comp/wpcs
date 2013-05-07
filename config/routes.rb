Wpcs::Application.routes.draw do

  post "ajax/convert_markdown"
  post "ajax/upload_image"

  match 'contests/:id/attend/' => "contests#attend"

  resources :groups, :only => [:index, :show, :new, :create]
  match 'groups/:id/join' => 'groups#join'

  resources :contests, :only => [:index, :show] do
    resource :score, :module => :contests
    resources :problems, :module => :contests, :only => [:index, :show] do
      member do
        post 'submit'
        # GET パラメータがうまくつかないので，やむなく2つに分けた．
        get 'download_large'
        get 'download_small'
      end
    end
  end

  # resources :problems

  resources :users, :only => [:create] do
    collection do
      # no :id
      get  'show', 'edit'
      put  'update'
      delete 'destroy'

      get  'login'
      get  'register'
      post 'authorize'
      post 'logout'
      post 'promote', 'demote'
    end
  end

  match 'admin' => 'admin#index'
  namespace :admin do
    resources :users
    resources :contests do
      resources :problems, :module => :contests
    end
    resources :images
    resources :groups
  end

  root :to => 'users#login'

  match 'auth/:provider/callback' => 'oauth#create'

  match '*path', to: 'errors#routing', via: :get

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
