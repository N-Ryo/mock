class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hack
  has_many :reactions, foreign_key: "comment_id"
  has_many :users, through: :reactions, dependent: :destroy
  has_many :discussions
  validates :content, presence: true
  validates :feeling, presence: true
end
