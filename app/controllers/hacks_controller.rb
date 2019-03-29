class HacksController < ApplicationController
  before_action :set_hack, only: [:show, :edit, :update, :destroy, :add]
  before_action :set_hack_tags_to_gon, only: [:show]

  # GET /hacks
  # GET /hacks.json
  def index
    @hacks = Hack.all
  end

  # GET /hacks/1
  # GET /hacks/1.json
  def show
    @comment = Comment.new
    @comment_num = Comment.where("hack_id = ?", @hack.id).count
    @comments = Comment.where("hack_id = ?", @hack.id).order(point: :desc).page(params[:page]).per(10)
  end

  # GET /hacks/new
  def new
    @hack = Hack.new
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end

  # GET /hacks/1/edit
  def edit
  end

  # POST /hacks
  # POST /hacks.json
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

  # PATCH/PUT /hacks/1
  # PATCH/PUT /hacks/1.json
  def update
    respond_to do |format|
      if @hack.update(hack_params)
        format.html { redirect_to @hack }
        # format.js
      else
        format.html { render :edit }
        # format.js
      end
    end
  end

  # DELETE /hacks/1
  # DELETE /hacks/1.json
  def destroy
    @hack.destroy
    respond_to do |format|
      format.html { redirect_to hacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hack
      unless hack_id = params[:hack_id]
        hack_id = params[:id]
      end
      p @hack = Hack.find(hack_id)
      p @hack.category.name
      p @hack.role.name
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hack_params
      params.require(:hack).permit(:id, :tag_list, :overview, :category_id, :role_id)
    end

    def set_hack_tags_to_gon
      gon.hack_tags = @hack.tag_list
    end
end
