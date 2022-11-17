class Food < ApplicationRecord
  MEASUREMENTS = ["ounces"].freeze
  TYPES_OF_FOOD = ["breast milk", "formula", "milk"].freeze

  validates :amount, :measurement, :food, presence: true
  validates :measurement, inclusion: { in: MEASUREMENTS }
  validates :food, inclusion: { in: TYPES_OF_FOOD } 
end
