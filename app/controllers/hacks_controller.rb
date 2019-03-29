class HacksController < ApplicationController
  before_action :set_hack, only: [:show, :edit, :update, :destroy, :add]
  before_action :set_hack_tags_to_gon, only: [:show]

  def index
    @hacks = Hack.all
  end

  def show
    @comment = Comment.new
    @comment_num = Comment.where("hack_id = ?", @hack.id).count
    @comments = Comment.where("hack_id = ?", @hack.id).order(point: :desc).page(params[:page]).per(10)
  end

  def new
    @hack = Hack.new
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end

  def edit
  end

  def create
    @hack = Hack.new(hack_params)

    respond_to do |format|
      if @hack.save
        format.html { redirect_to @hack, notice: 'Hack was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @hack.update(hack_params)
        format.html { redirect_to @hack }
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @hack.destroy
    respond_to do |format|
      format.html { redirect_to hacks_url }
      format.json { head :no_content }
    end
  end

  private
    def set_hack
      unless hack_id = params[:hack_id]
        hack_id = params[:id]
      end
      @hack = Hack.find(hack_id)
    end

    def hack_params
      params.require(:hack).permit(:id, :tag_list, :overview, :category_id, :role_id)
    end

    def set_hack_tags_to_gon
      gon.hack_tags = @hack.tag_list
    end
end
