class StaticPagesController < ApplicationController
  def home
    @hacks = Hack.all
    @daily_hacks = @hacks.where("created_at >= ?", Time.current - 1.day)
    @weekly_hacks = @hacks.where("created_at >= ?", Time.current - 1.week)
    @monthly_hacks = @hacks.where("created_at >= ?", Time.current - 1.month)
    @user = User.new
  end
end
