Rails.application.routes.draw do

  resources :problems
  resources :masses
  resources :photos
  resources :molts
  resources :feeds
  resources :pets
  devise_for :users
root 'photos#index'
get 'pages/about'
  get '/pets/:id/feed' => 'feeds#new', as: "pets_feeding"
  get '/pets/:id/molt' => 'molts#new', as: "pets_molting"
  get '/pets/:id/photo' => 'photos#new', as: "pets_photing"
  get '/pets/:id/photos' => 'photos#pet_photos', as: "pet_photos"
  get '/pets/:id/mass' => 'masses#new', as: "pets_massing"
  get '/pets/:id/masses' => 'masses#pet_masses', as: "pet_masses"
  get '/pets/:id/problem' => 'problems#new', as: "pets_probleming"
  get '/pets/:id/problems' => 'problems#pet_problems', as: "pet_problems"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
