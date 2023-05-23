Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/generar_pdf', to: 'anticipos#generar_pdf', as: 'generar_pdf', format: :pdf


  root 'home#index'
  resources :home
  resources :anticipos
  resources :arquitectos
  resources :obras
end
