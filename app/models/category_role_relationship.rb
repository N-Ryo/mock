class CategoryRoleRelationship < ApplicationRecord
  belongs_to :category
  belongs_to :role
  has_many :hacks
end
