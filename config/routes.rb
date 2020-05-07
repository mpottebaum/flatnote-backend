Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :notes
  end

  post '/auth', to: 'auth#create'
  get '/auth', to: 'auth#show'
end
