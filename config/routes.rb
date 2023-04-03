Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 会員側のルーティング設定
  scope module: :public do
    get 'items' => 'items#index'
  end

  namespace :admin do
    resources :items
  end
end