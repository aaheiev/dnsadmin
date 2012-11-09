class CreateIpAddresses < ActiveRecord::Migration
  def up
    create_table :ip_addresses, :id => false do |t|
      t.string :ip, :limit => 16, :null => false
      t.references :host, :null => false
      t.boolean :is_primary, :default => false
      t.boolean :active, :default => true
    end
    add_index :ip_addresses, :ip, :unique => true
    add_index :ip_addresses, :host_id
    add_index :ip_addresses, :active
    execute "ALTER TABLE ip_addresses ADD PRIMARY KEY (ip);"
    execute "ALTER TABLE ip_addresses ADD FOREIGN KEY (host_id) REFERENCES hosts(id);"
  end
  def down
    drop_table :ip_addresses
  end
end
