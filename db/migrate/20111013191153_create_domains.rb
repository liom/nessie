class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|

      t.string  :name,            :null => false
      t.string  :master,          :null => true
      t.integer :last_check,      :null => true,  :default => nil
      t.string  :type,            :null => false
      t.integer :notified_serial, :null => true, :default => nil
      t.string  :account,         :null => true, :default => nil

      t.timestamps
    end
    
    add_index :domains, :name, :unique => true
  end
end