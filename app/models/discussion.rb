class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :reply_discussions, class_name: "Discussion" 

  validates :content, presence: true, length: { maximum: 250 }
end

