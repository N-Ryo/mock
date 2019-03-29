class StaticPagesController < ApplicationController
  include Trend
  def home
    @hacks = Hack.all
    @user = User.new

    
    @daily_hacks = calculation(Time.current - 1.day)
    @weekly_hacks = calculation(Time.current - 1.week)
    @monthly_hacks = calculation(Time.current - 1.month)
    
  end
end
