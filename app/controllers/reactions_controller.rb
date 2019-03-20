class ReactionsController < ApplicationController

  def create
    @user = current_user
    @comment = Comment.find(params[:comment_id])
    @hack = @comment.hack
    @reaction = @user.first_reaction(@comment.id, params[:evaluation])
    point = @user.proficiency * @reaction['evaluation']
    @comment.point += point
    @comment.save
    @hack.point += point
    @hack.save
    respond_to do |format|
      format.html { redirect_to @comment.hack }
      format.js
    end
  end

  def update
    @user = current_user
    @reaction = Reaction.find(params[:id])
    @comment = @reaction.comment
    @hack = @comment.hack
    before_reaction = @reaction.evaluation
    @reaction.update_attribute(:evaluation, params[:evaluation])
    point = @user.proficiency * (@reaction['evaluation'] - before_reaction)
    @comment.point += point
    @comment.save
    @hack.point += point
    @hack.save
    # @user.change_reaction(@comment, params[:commit])
    respond_to do |format|
      format.html { redirect_to @comment.hack }
      format.js
    end
  end
end
