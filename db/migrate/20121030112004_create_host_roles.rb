class CreateHostRoles < ActiveRecord::Migration
  def change
    create_table :host_roles do |t|
      t.string :title, :null => false
      t.string :description
    end
    add_index :host_roles, :title, :unique => true
  end
end
