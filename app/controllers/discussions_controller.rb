class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:update, :destroy]
  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.save
    respond_to do |format|
      format.html { redirect_to @discussion.comment }
      format.js
    end
  end

  def update
    @discussion.update(discussion_params)
    respond_to do |format|
      format.html { redirect_to @discussion.comment }
      format.js
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @discussion.comment }
      format.js
    end
  end

  private
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def discussion_params
      params.require(:discussion).permit(:content, :user_id, :comment_id, :discussion_id)
    end
end
