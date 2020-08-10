Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root "messages#index" #ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるように。
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
