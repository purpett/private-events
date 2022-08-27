class AddCreatorIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :creator_id, :integer
    add_foreign_key :events, :users, column: :creator_id  # guarantees that creator_id references an existing user_id. :sourcetable, :destinationtable, column: :namechosendifferentfromnormal
  end
end
