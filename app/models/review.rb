class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5
end
