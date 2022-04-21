class ApplicationController < ActionController::Base
<<<<<<< HEAD

=======
  before_action :authenticate_user!, except: [:top, :about]
>>>>>>> develop

  def after_sign_in_path_for(resource)
    deliveries_path # ログイン後に遷移するpathを設定
  end
end
