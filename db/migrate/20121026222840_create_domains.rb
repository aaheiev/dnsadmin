class CreateDomains < ActiveRecord::Migration
  def up
    create_table :domains do |t|
      t.string :name, :null => false
      t.references :provider
      t.references :domain_type
      t.references :domain_status
      t.date :expiration_date
      t.integer :dns_domain_id

      t.string :master, :limit => 128
      t.integer :last_check
      t.string :type, :limit => 10, :null => false, :default => 'NATIVE'
      t.string :notified_serial
      t.string :account, :limit => 40

      t.text :comments
      t.boolean :active, :default => true
      t.boolean :in_dns, :default => false

      t.timestamps
    end
    add_index :domains, :provider_id
    add_index :domains, :domain_type_id
    add_index :domains, :name, :unique => true
    add_index :domains, :in_dns
    add_index :domains, :active
    execute "ALTER TABLE domains ADD FOREIGN KEY (provider_id) REFERENCES providers(id);"
    execute "ALTER TABLE domains ADD FOREIGN KEY (domain_type_id) REFERENCES domain_types(id);"
    execute "ALTER TABLE domains ADD FOREIGN KEY (domain_status_id) REFERENCES domain_statuses(id);"
  end

  def down
    drop_table :domains
  end
end
