class Food < ApplicationRecord

  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :recipe_foods, foreign_key: :food_id, dependent: :delete_all
  validates :quantity, presence: true

end