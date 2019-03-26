class Reaction < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :evaluation, presence: true
end
