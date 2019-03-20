module Trend
  extend ActiveSupport::Concern
  def calculation(reactions, trend_hacks)
    rs = reactions.find_by_sql(
      "SELECT
        hack_id, sum(point_id) as points_id
      FROM (
        SELECT
         comments.hack_id, (reactions.evaluation * users.proficiency) as point_id
        FROM reactions
          INNER JOIN comments ON reactions.comment_id = comments.id
          INNER JOIN users ON reactions.user_id = users.id
      )
      GROUP BY hack_id
      ORDER BY sum(point_id) DESC"
    )
    rs.each do |r|
      trend_hacks[Hack.find(r[:hack_id])] = r[:points_id]
    end
  end
end