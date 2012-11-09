class CreateApps < ActiveRecord::Migration
  def up
    create_table :apps do |t|
      t.string :name
      t.references :domain
      t.string :app_type
      t.string :access_scope, :null => false, :default => 'public'
      t.string :ssl_type
      t.boolean :active, :default => true
      t.string :http_auth_user
      t.string :http_auth_pass
      t.text :comments
    end
    add_index :apps, :domain_id
    add_index :apps, :app_type
    execute "ALTER TABLE apps ADD FOREIGN KEY (domain_id) REFERENCES domains(id);"
  end
  def down
    drop_table :apps
  end
end
