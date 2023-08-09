class RemoveDuplicateConstraintFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :foods, column: :user_id, name: 'fk_rails_541e2e5c7b'
  end
end