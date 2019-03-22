class UserCategoryRelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @hack = Hack.find(params[:hack_id])
    @category = @hack.category
    current_user.category_follow(@category)
    respond_to do |format|
      format.html { redirect_to @hack }
      format.js
    end
  end

  def destroy
    @hack = Hack.find(params[:hack_id])
    @category = UserCategoryRelationship.find(params[:id]).category
    current_user.category_unfollow(@category)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
