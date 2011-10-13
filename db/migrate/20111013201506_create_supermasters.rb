class CreateSupermasters < ActiveRecord::Migration
  def change
    create_table :supermasters do |t|
      
      t.string  :ip,          :null => false 
      t.string  :nameserver,  :null => false 
      t.string  :account,     :null => true

      t.timestamps
    end
  end
end
