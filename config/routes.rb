Rails.application.routes.draw do
# rails routes | grep user でuserが入っているルーティングだけ呼び出せる
  devise_for :users
  root to: "home#index"
  resources :users
  # scope module: :users do
    get '/users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
  # end
  resources :noodles do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:index, :edit, :create, :destroy]
  end

end
