class Category < ApplicationRecord
  has_many :roles
  has_many :hacks, inverse_of: :category
end
