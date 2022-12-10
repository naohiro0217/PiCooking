Rails.application.routes.draw do

  root :to =>"public/homes#top"
  get "/about"=>"public/homes#about"

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


  scope module: :public do
    resources :cooks, only: [:index,:show,:edit,:create,:destroy,:update] do
      resources :cook_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:index,:show,:edit,:update]
    # 会員側の退会確認画面,退会処理
    get '/customers/quit' => 'customers#quit'
    patch '/customers/out' => 'customers#out'
  end

  namespace :admin do
    resources :cooks, only: [:index, :show, :edit, :destroy]
    resources :customers, only: [:index, :edit, :update, :show]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
