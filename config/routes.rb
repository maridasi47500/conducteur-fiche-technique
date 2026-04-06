Rails.application.routes.draw do
  resources :inspiration_resources
  resources :zones
  resources :ambiance_options
  resources :styles
  resources :metier_dependencies
  resources :sequence_templates
  resources :projet_artistiques
  resources :materiel_necessaires
  resources :plan_de_scene_dessins
  resources :projets
  resources :fiche_techniques do
   member do
   get "editplandescene"
   end
  end
  resources :materiels
  resources :conducteurlines
  resources :conducteurs do

    member do
      get "editformlines"
      get :inspiration_view
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "conducteurs#index"
end
