class UsersController < ApplicationController
  def edit
  end
  # editアクションでは、ビューファイルを表示するだけなので、アクションの定義のみ

  def update
    if current_user.update(user_params)     
    # ユーザー情報が格納されているcurrent_userメソッド（ログインしているユーザーを取得する）を使用して、ログインしているユーザーの情報を更新
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params 
    # ストロングパラメーターを使用し、user_paramsを定義。
    params.require(:user).permit(:name, :email)
    # user_paramsの中でpermitメソッドを使用し、「name」と「email」の編集を許可
  end

end
