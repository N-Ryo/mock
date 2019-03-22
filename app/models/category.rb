class Category < ApplicationRecord
  has_many :roles
  has_many :hacks, inverse_of: :category
  has_many :user_category_relationships
  has_many :users, through: :user_category_relationships
end
