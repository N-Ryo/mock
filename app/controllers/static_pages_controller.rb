class StaticPagesController < ApplicationController
  include Trend
  def home
    @hacks = Hack.all
    @user = User.new

    @daily_hacks = {}
    daily_reactions = Reaction.where("updated_at >= ?", Time.current - 1.day)
    calculation(daily_reactions, @daily_hacks)

    @weekly_hacks = {}
    weekly_reactions = Reaction.where("updated_at >= ?", Time.current - 1.week)
    calculation(weekly_reactions, @weekly_hacks)

    @monthly_hacks = {}
    monthly_reactions = Reaction.where("updated_at >= ?", Time.current - 1.month)
    calculation(monthly_reactions, @monthly_hacks)
  end
end
