class AddNotNullConstraintsToEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :title, :string, null: false
    change_column :events, :event_date, :datetime, null: false
  end
end
