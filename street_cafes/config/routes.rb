Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :post_code_data, only: %i[index]

  resources :categories, only: %i[index create]

  delete '/street_cafes', to: 'street_cafes#destroy'
end
