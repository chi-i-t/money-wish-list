class AddColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :advice_id, :integer
  end
end
