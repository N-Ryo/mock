class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render layout: false
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      log_in @user
      redirect_to @user
    else
      render :new, layout: false
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :proficiency,
                                   :website_url, :organization, :location, :description)
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def set_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to(root_url)
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end
