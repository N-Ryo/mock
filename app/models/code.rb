class Code < ApplicationRecord
    belongs_to :user
    belongs_to :hack
    #あとでmoveの数降順になるように変更
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 50 }
end
