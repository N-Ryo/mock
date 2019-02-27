class Role < ApplicationRecord
  has_many :categories
  has_many :hacks, inverse_of: :role
end
