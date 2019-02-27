class Hack < ApplicationRecord
  validates :overview, presence: true, length: { maximum: 150 }
  has_many :comments
  accepts_nested_attributes_for :comments


  belongs_to :role,  inverse_of: :hacks
  accepts_nested_attributes_for :role

  belongs_to :category
  
  acts_as_taggable
  
end
