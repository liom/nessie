class AddStiTypeToRecords < ActiveRecord::Migration
  def change
    add_column :records, :sti_type, :string
  end
end