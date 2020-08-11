class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    #↑binding.pryで、pryにparamsと打ち込むと{"name"=>"新規チャット", "user_ids"=>["", "1", "2"]}が出てくるので、「user_ids」キーに「所属ユーザーのidの配列」が送信されていることがわかります。つまり、ビュー側からコントローラー側へ正しく値が送られていることが確認できました。
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
    # どのチャットルームを削除するのかを特定する場合は、Room.find.params[:id]を使用して、削除したいチャットルームの情報を取得。
    # destroyアクションは、削除するだけなのでビューの表示は必要なし。そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用。
    # destroyメソッドが実行されたら、root（roomsのindex）にリダイレクトする記述をする。
  end


  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end

end

