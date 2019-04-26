module Trend
  extend ActiveSupport::Concern
  def calculation(date)
    return Hack.find_by_sql(["
      SELECT
        hacks.*, categories.name as cname, roles.name as rname, sum(reactions.evaluation * users.proficiency) as trend_point
      FROM reactions
        INNER JOIN users ON reactions.user_id = users.id
        INNER JOIN comments ON reactions.comment_id = comments.id
        INNER JOIN hacks ON comments.hack_id = hacks.id
        INNER JOIN categories ON hacks.category_id = categories.id
        INNER JOIN roles ON hacks.role_id = roles.id
      WHERE
        reactions.updated_at >= ?
      GROUP BY hacks.id, categories.name, roles.name
      ORDER BY trend_point desc
      LIMIT 20",
      date
    ])
 
  end
end