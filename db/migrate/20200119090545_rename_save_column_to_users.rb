class RenameSaveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :save, :savings
  end
end

