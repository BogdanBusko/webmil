Rails.application.routes.draw do
  root 'links#index'

  resources :links

  get '/:tag', to: 'links#by_tag', as: 'links_by_tag'

  devise_for :users
end
