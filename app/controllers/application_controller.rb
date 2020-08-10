class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseのコントローラーから呼び出された場合は、configure_permitted_parametersメソッドが呼ばれると言うこと。↑↑↑
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersメソッドの定義を行なっています。
  # deviseをインストールすることでdevise_parameter_sanitizerメソッドが使えるようになります。deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッドです。
  # 今回は「nameカラム」を追加したので、このメソッドを使用し、「name」キーの内容の保存をpermitメソッドで許可しています。
end
