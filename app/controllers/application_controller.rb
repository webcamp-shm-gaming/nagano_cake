class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    deliveries_path # ログイン後に遷移するpathを設定
  end
end
