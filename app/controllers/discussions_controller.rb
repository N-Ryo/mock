class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:update, :destroy]
  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.save
    if @discussion.discussion_id
      @replied_discussion = Discussion.find(@discussion.discussion_id)
    end
    @discussions = Discussion.where(comment_id: @discussion.comment_id)
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
    @discussion_id = @discussion.discussion_id
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
