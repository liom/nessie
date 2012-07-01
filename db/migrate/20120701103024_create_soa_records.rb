class CreateSoaRecords < ActiveRecord::Migration
  def change
    create_table :soa_records do |t|
      t.string      :hostmaster,      :null => false
      t.integer     :serial,          :null => false
      t.integer     :slave_refresh,   :null => false
      t.integer     :slave_retry,     :null => false
      t.integer     :transfer_expire, :null => false
      t.integer     :default_ttl,     :null => false

      t.references  :domain
      t.references  :ns_record

      t.timestamps
    end
  end
end
