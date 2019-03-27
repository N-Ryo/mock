class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_search
  include SessionsHelper
  helper_method :category_list, :role_list

  def category_list
    @category_list = Category.includes(:hacks).all   
  end

  def role_list
    @role_list = Role.includes(:hacks).all
  end


  def set_search
    unless params[:q].nil?
      p params[:q].keys[0]
      case params[:q].keys[0]
      when "overview_or_role_name_or_category_name_or_tags_name_cont"
        groupings = []
        keywords = params[:q][:overview_or_role_name_or_category_name_or_tags_name_cont].split(/[\p{blank}\s]+/)
        keywords.each { |value| groupings.push(overview_or_role_name_or_category_name_or_tags_name_cont: value) }
        @key_word = '"' + keywords.join('", "') + '"'
        @q = Hack.ransack(
          combinator: 'and',
          groupings: groupings
        )
      when "category_name_cont"
        @key_word = params[:q][:category_name_cont]
        @q = Hack.ransack(params[:q])
      when "role_name_cont"
        @key_word = params[:q][:role_name_cont]
        @q = Hack.ransack(params[:q])
      end
    else
      @q = Hack.ransack(params[:q])
    end
    @hacks = @q.result.includes(:category, :role).page(params[:page]).to_a.uniq
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
