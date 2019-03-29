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
      GROUP BY hacks.id
      ORDER BY trend_point desc
      LIMIT 20",
      date
    ])
 

    if false
    return Hack.find_by_sql([
        "SELECT
          *, categories.name as cname, roles.name as rname
        FROM (
          SELECT
            *, hacks.category_id as cid, hacks.role_id as rid, sum(p.point_id) as points_id
          FROM (
            SELECT
              *, comments.hack_id as ch_id, (reactions.evaluation * users.proficiency) as point_id
            FROM reactions
              INNER JOIN comments ON reactions.comment_id = comments.id
              INNER JOIN users ON reactions.user_id = users.id
            WHERE
              reactions.updated_at >= ?
          ) as p
            INNER JOIN hacks ON p.ch_id = hacks.id
          GROUP BY hacks.id
          ORDER BY points_id DESC
        ) as pid
          INNER JOIN categories ON pid.cid = categories.id
          INNER JOIN roles ON pid.rid = roles.id",
        date
      ])

    
    
      Hack.find_by_sql([
      "SELECT
        *, sum(point_id) as points_id
      FROM (
        SELECT
          *, (reactions.evaluation * users.proficiency) as point_id
        FROM hacks
          RIGHT JOIN comments ON hacks.id = comments.hack_id
          INNER JOIN reactions ON comments.id = reactions.comment_id
          INNER JOIN users ON reactions.user_id = users.id
        WHERE
            reactions.updated_at >= ?
        ) as point",
      date
    ])
    
      Reaction.find_by_sql([
        "SELECT
          *, categories.name as cname, roles.name as rname, sum(point_id) as points_id
        FROM (
          SELECT
          comments.hack_id as ch_id, (reactions.evaluation * users.proficiency) as point_id
          FROM reactions
            INNER JOIN comments ON reactions.comment_id = comments.id
            INNER JOIN users ON reactions.user_id = users.id
          WHERE
            reactions.updated_at >= ?
        ) as point
          INNER JOIN hacks ON point.ch_id = hacks.id
          INNER JOIN categories ON hacks.category_id = categories.id
          INNER JOIN roles ON hacks.role_id = roles.id
          LEFT OUTER JOIN taggings ON hacks.id = taggings.taggable_id
          LEFT OUTER JOIN tags ON taggings.tag_id = tags.id
        GROUP BY hacks.id
        ORDER BY points_id DESC",
        date
      ])
    end
    
    # rs.each do |r|
    #   trend_hacks[Hack.includes(:category, :role, :tags).find(r[:hack_id])] = r[:points_id]
    # end
  end
end