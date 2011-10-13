class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    
      t.integer :domain_id,   :null => true
      t.string  :name,        :null => true
      t.string  :type,        :null => true
      t.string  :content,     :null => true
      t.integer :ttl,         :null => true
      t.integer :prio,        :null => true
      t.integer :change_date, :null => true

      t.timestamps
    end

    add_index :records, :name
    add_index :records, [:name, :type]
    add_index :records, :domain_id
  end
end
