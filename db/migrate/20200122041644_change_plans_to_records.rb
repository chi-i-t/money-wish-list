class ChangePlansToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_table :plans, :records
  end
end
