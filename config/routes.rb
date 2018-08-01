Rails.application.routes.draw do
  devise_for :users
  get '/links/:tag', to: 'links#by_tag', as: 'links_by_tag'

  resources :links

  root 'links#index'
end
