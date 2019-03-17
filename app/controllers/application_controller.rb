class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :category_list, :role_list

  def category_list
    @category_list = Category.includes(:hacks).all   
  end

  def role_list
    @role_list = Role.includes(:hacks).all
  end

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
