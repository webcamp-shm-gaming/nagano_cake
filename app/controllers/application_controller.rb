class ApplicationController < ActionController::Base
<<<<<<< HEAD


  def after_sign_in_path_for(resource)
   deliveries_path # ログイン後に遷移するpathを設定
=======
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    deliveries_path # ログイン後に遷移するpathを設定
>>>>>>> origin/develop
  end
end
