Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
 #resources :projects
  # You can have the root of your site routed with "root"
  
  #get 'project/:id' => 'projects#show', :as => :project 
  #get 'project/edit/:id' => 'projects#edit', :as => :project_edit
  #get 'projects/new' => 'projects#new'
  root 'projects#index'
  resources :projects do
    resources :bugs

    member do
      get 'managerProfile' 
    end

    collection do 
      get 'projectTeam'
    end
  end

  # get 'bug/new/:id' => 'bugs#new',:as => :bug_new
  # #get 'project/:id/bugs' => 'bugs#index', :as => :bugs
  # get 'bug/edit/:id' => 'bugs#edit', :as => :bug_edit
  # delete 'bug/destroy/:id' => 'bugs#destroy', :as => :bug_destroy
  # patch 'bug/update/:id' => 'bugs#update', :as => :bug_update
  # get 'bug/assign/:id' => 'bugs#assign', :as => :bug_assign


 # resources :bugs do
 #       member do
         
 # end


  

 
 #resources :bugs


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
