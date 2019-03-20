class Hack < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments


  belongs_to :role,  inverse_of: :hacks
  accepts_nested_attributes_for :role

  belongs_to :category
  
  acts_as_taggable
  validates :overview, presence: true, length: { maximum: 150 }
  validates :category, presence: true
  validates :role, presence: true
end
