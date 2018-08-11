Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'links#index'

  resources :links

  get '/:tag', to: 'links#by_tag', as: 'links_by_tag'

  devise_for :users
end
