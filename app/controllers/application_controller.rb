class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
   public_deliveries_path # ログイン後に遷移するpathを設定
  end
end
