 Rails.application.routes.draw do
   
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get'/' =>'homes#top',as:'top'
    resources :customers,only: [:index, :show, :edit, :update,]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/:id/edit'=> "customers#edit"
    # patch 'customers/:id'=> "customers#update"
    get 'genres/index'
    resources :genres,only: [:update, :edit,]
    resources :orders
    post 'genres/create'
  end

  scope module: :public do
    delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
    resources :cart_items, only: [:destroy,:index,:update,:create]

  end


  get 'homes/top'


  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'about' =>'homes#about'
    resources :items
    resources :orders,only:[:new,:index,:show,:create]
    post "/customers/orders/confirmation" => "orders#confirmation"
    get "customers/orders/completion" => "orders#completion"
   resources :customers,only:[:update]
    get '/customers/mypage' =>'customers#show'
    get "/customers/withdraw" => "customers#withdraw"

    patch "/customers/mypage" => "customers#update"
    get "/customers/mypage/edit" => "customers#edit"
    get "/customers/quit" => "customers#quit"
  end

  namespace :admin do
    resources :items
  end
end
