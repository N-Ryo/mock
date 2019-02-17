class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please sign in."
        redirect_to signin_url
      end
    end
end
