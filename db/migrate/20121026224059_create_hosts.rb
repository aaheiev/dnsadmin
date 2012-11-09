class CreateHosts < ActiveRecord::Migration
  def up
    create_table :hosts do |t|
      t.string :name, :null => false
      t.string :ip, :limit => 16
      t.references :provider, :null => false
      t.string :location
      t.string :hw_type
      t.string :prod_number
      t.string :billing_number
      t.decimal :price_per_mon, :precision => 5, :scale => 2,:default => '0.0'
      t.string :operating_system
      t.boolean :active
      t.boolean :available

      t.timestamps
    end
    add_index :hosts, :name, :unique => true
    add_index :hosts, :provider_id
    add_index :hosts, :ip, :unique => true
    add_index :hosts, :active

    execute "ALTER TABLE hosts ADD FOREIGN KEY (provider_id) REFERENCES providers(id);"
  end

  def down
    drop_table :hosts
  end
end
