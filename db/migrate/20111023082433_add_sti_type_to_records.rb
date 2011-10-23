class AddStiTypeToRecords < ActiveRecord::Migration
  def change
    add_column :records, :sti_type, :string, :null => false
  end
end