Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # root "messages#index" #ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるように。
  root "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
    # ↑メッセージを投稿する際には、どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用。「チャットルームに属しているメッセージ」と言う意味。これによって、メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようになります。
  end
end
