class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
      # @roomには、Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入。
      # 紐解いて説明すると、直前の問題にあった通りルーティングをネストしているため/rooms/:room_id/ messagesといったパスになる。# パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在。そのため、params[:room_id]と記述することでroom_idを取得できる。
    @messages = @room.messages.includes(:user)
        # チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義。
        # そして、一覧画面で表示するメッセージ情報には、ユーザー情報も紐付いて表示される。
        # この場合、メッセージに紐付くユーザー情報の取得に、メッセージの数と同じ回数のアクセスが必要に なるので、N+1問題が発生。includesメソッドを使用して、解消。
        # 全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができる。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。その値を@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存。
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
    # createアクション内に、メッセージを保存できた場合とできなかった場合で条件分岐の処理を行う。@message.saveでメッセージの保存に成功した場合、room_messages_path(@room)
    # (参加しているチャットルームに投稿したメッセージの一覧画面）にリダイレクトし、失敗した場合、indexアクションが実行され、同じページに戻るという記述。
  end


  


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可
  end

end

