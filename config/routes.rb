Wadrorstats::Application.routes.draw do
  resources :feedbacks

  resources :version_controls

  resources :peer_reviews

  resources :miniprojects do
    collection do
      get 'list'
    end
   end

  resources :projects

  resources :students do
    member do
      get 'submissions'
    end
  end

  resources :week_statistics

  resources :courses do
    member do
      get 'submissions'
      get 'week_statistics'
      get 'feedbacks'
    end
  end

  resources :configurations

  resources :submissions do
    collection do
      get 'public'
      get 'new_admin'
    end
  end

  post '/participants', to:'participants#create'

  get 'api/week_stats', to:'api#week_stats'

  get 'courses/api/week_stats', to:'api#week_stats'

  get 'versionhallinta', to:'version_controls#new'

  root 'courses#current'

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
