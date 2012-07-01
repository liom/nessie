class CreateARecords < ActiveRecord::Migration
  def change
    create_table :a_records do |t|
      t.string      :name,    :null => false
      t.string      :address, :null => false
      t.references  :domain

      t.timestamps
    end
  end
end
