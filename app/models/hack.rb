class Hack < ApplicationRecord
    has_many :codes, dependent: :destroy
    acts_as_taggable
end
