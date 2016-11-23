Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :categories, only: [:index, :show]
  resources :pois, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create, :show, :index, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
mount Attachinary::Engine => "/attachinary"

# '/pois'
# GET 'pois#index'

# '/pois/new'
# GET 'pois#new'
# POST 'pois#create'

# '/pois/:id'
# GET 'pois#show'

# '/pois/:id/reviews/new'
# GET 'reviews#new'
# POST 'reviews#create'

# '/pois/:id/reviews/1'
# GET 'reviews#show'

# '/pois/:id/reviews'
# GET 'reviews#index'
