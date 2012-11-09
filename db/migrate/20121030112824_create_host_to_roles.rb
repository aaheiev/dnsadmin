class CreateHostToRoles < ActiveRecord::Migration
  def up
    create_table :host_to_roles, :id => false do |t|
      t.references :host, :null => false
      t.references :host_role, :null => false
    end
    add_index :host_to_roles, :host_id
    add_index :host_to_roles, :host_role_id
    execute "ALTER TABLE host_to_roles ADD PRIMARY KEY (host_id,host_role_id);"
    execute "ALTER TABLE host_to_roles ADD FOREIGN KEY (host_id) REFERENCES hosts(id);"
    execute "ALTER TABLE host_to_roles ADD FOREIGN KEY (host_role_id) REFERENCES host_roles(id);"
  end
  def down
    drop_table :host_to_roles
  end
end
