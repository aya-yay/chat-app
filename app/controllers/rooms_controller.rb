class RoomsController < ApplicationController
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

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end

end

