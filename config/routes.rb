Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
root to: "posts#index"

get "login", to: "sessions#new"
  #/loginというURLをGETすると、sessions_controllerのnewアクションを実行
post "login", to: "sessions#create"
  #loginページでpostすると～
delete "logout", to: "sessions#destroy"
  #logoutとしてdeleteをリクエストすると～

get "signup", to: "users#new"
 #ユーザ登録画面
 
resources :posts
# RESTfulなルーティング
  
resources :user, only:[:show, :new, :create, :edit]
# は、下記をまとめて記述したもの。
# get "user/:id" to: "users#show"
# get "user" to: "users#neww"
# post "user" to: "users#create"
# get "user/:id/edit" to: "users#edit"
end
