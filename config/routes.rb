Rails.application.routes.draw do
  resources :directive_artistiques
  resources :stage_themes
  resources :emotional_markers
  # config/routes.rb
  resources :inspiration_resources do
    collection do
      get :completeness_audit
    end
  end
  resources :zones
  resources :ambiance_options
  resources :styles
  resources :metier_dependencies
  resources :sequence_templates do
    collection do
      get "newconducteur"
      patch "generateconducteur"
    end
  end
  resources :projet_artistiques
  resources :materiel_necessaires
  resources :plan_de_scene_dessins
  resources :projets
  resources :fiche_techniques do
   member do
   get "editplandescene"
   get "refaireplandescene"
   end
  end
  resources :materiels
  resources :conducteurlines
  resources :conducteurs do

    member do
      post "generate_advanced_conductor"
      get "advanced_generator"
      patch "mixer_ingredients"
      get "ingredients"
      get "star"
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
