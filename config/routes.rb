Rails.application.routes.draw do
  get 'messages/index'
  root "messages#index" #ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出されるように。
end
