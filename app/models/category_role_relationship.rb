class CategoryRoleRelationship < ApplicationRecord
  belongs_to :category
  belongs_to :role
end
