Rails.application.routes.draw do

  resources :feeds
  resources :pets
  devise_for :users
root 'pages#landing'
get 'pages/about'
  get '/pets/:id/feed' => 'feeds#new', as: "pets_feeding"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
