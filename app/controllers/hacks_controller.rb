class HacksController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :set_hack, only: :destroy
  def new
    @hack = Hack.new
  end

  def create
    @hack = Hack.new(hack_params)

    respond_to do |format|
      if @hack.save
        format.html { redirect_to new_hack_code_path(@hack.id), notice: 'Hack was successfully created. Next, finish to fill in fields.' }
        format.json { render :show, status: :created, location: @hack }
      else
        format.html { render :new }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hack.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Hack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hack
      @hack = Hack.find(params[:id])
    end

    def hack_params
      params.require(:hack).permit(:category, :subcategory, :tag_list)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
