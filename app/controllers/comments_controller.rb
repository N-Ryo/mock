class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_comments, only: [:create, :update, :destroy]
  before_action :set_hack, only: [:create, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to hack_path(comment_params[:hack_id]), notice: 'コメントしました。' }
        format.js
      else
        format.html { redirect_to "/hacks/#{params[:hack_id]}" }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_comments
      @comments = Comment.where("hack_id = ?", params[:hack_id])
    end

    def set_hack
      @hack = Hack.find(params[:hack_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:feeling, :content, :user_id, :hack_id)
    end
end
