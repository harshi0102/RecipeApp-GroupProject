class Food < ApplicationRecord
  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :price, :quantity, numericality: true
  validates :name, uniqueness: true
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :food_id, dependent: :delete_all
end
