Rails.application.routes.draw do
  resources :categories, except: :show
  resources :products, path: "/"
  # patch '/products/:id', to: 'products#update'
  # delete '/products/:id', to: 'products#destroy'
  # post '/products', to: 'products#create'
  # get '/products', to: 'products#index'
  # get 'products/new', to: 'products#new', as: 'new_product'
  # get 'products/:id', to: 'products#show', as: 'product'
  # get 'products/:id/edit', to: 'products#edit', as: 'edit_product'
end
