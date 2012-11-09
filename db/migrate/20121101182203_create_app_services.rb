class CreateAppServices < ActiveRecord::Migration
  def up
    create_table :app_services do |t|
      t.string :name
      t.references :app
      t.string :ip, :limit => 16
      t.integer :prio, :default => 0
      t.boolean :active, :default => true
      t.string :status, :default => 'UP'

    end
    add_index :app_services, :app_id
    add_index :app_services, :ip
    add_index :app_services, :active
    add_index :app_services, :status
    execute "ALTER TABLE app_services ADD FOREIGN KEY (app_id) REFERENCES apps(id);"
    execute "ALTER TABLE app_services ADD FOREIGN KEY (ip) REFERENCES ip_addresses(ip);"
  end
  def down
    drop_table :app_services
  end
end
