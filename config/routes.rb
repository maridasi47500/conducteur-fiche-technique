Rails.application.routes.draw do
  resources :projet_artistiques
  resources :materiel_necessaires
  resources :plan_de_scene_dessins
  resources :fiche_techniques do
   member do
   get "editplandescene"
   end
  end
  resources :materiels
  resources :conducteurlines
  resources :conducteurs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "conducteurs#index"
end
