class AddTtlToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :ttl, :integer, :default => 86400, :null => true
  end
end