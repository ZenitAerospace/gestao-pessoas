Rails.application.routes.draw do
  resources :notifications, only: [:show,:update,:index,:destroy]
  resources :professional_informations
  resources :searches
  resources :projects
  resources :activities
  get 'project/:project_id/activities/new' => 'activities#new', as: :new_project_activity
  get 'has_notification/' => 'notifications#has_notification'
  resources :subjects

  devise_for :users, :path => "accounts",
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
    }

  devise_scope :user do
    authenticated :user do
      root 'users#myprofile', as: :authenticated_root
    end
    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :roles, only: [:index]
  #get 'role/all' => 'role#index'
  #get 'role/:id/edit_role' => 'role#edit', as: :edit_user_role
  #put 'role/:id/edit_role' => 'role#update'

  get 'users/:id' => 'users#profile', as: :user
  resources :users, only: [:index] do
    get 'edit_role' => 'roles#edit'
    post 'edit_role' => 'roles#update'
    resources :personal_informations, only:[:show,:edit,:update,:create,:new]
    resources :academic_informations, only:[:show,:edit,:update,:create,:new,:index]
    resources :timetabling, only: [:show,:create, :edit]
    get 'coursed_subject' => 'timetabling#made_subject'
    get 'update_coursed_subject' => 'timetabling#uncourse_subject'
    post 'update_coursed_subject' => 'timetabling#update_coursed'
    resources :professional_profiles, only:[:show,:new] do
      resources :extra_skills
      resources :external_projects
      resources :internships
    end
  end
  root 'users/sessions#new'
  get "my_academic_information" => "users#my_academic_informations"
  get "my_subjects" => "users#my_subjects"
  get "my_professional_profile" => "users#my_professional_profile"

  # Activities path.
  get 'activities' => 'activities#index'
  get 'new_activity' => 'activities#new'

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
