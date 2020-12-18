Rails.application.routes.draw do


  devise_for :users
  root to: "home#index"
  resources :users
  # scope module: :users do
    get '/users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
  # end
  resources :noodles do
    resource :favorites, only: [:create, :destroy]
  end

end
