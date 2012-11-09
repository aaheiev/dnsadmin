class CreateRecords < ActiveRecord::Migration
  def up
    create_table :records do |t|
      t.references :domain, :null => false
      t.string :name
      t.string :type, :limit => 10
      t.text :content
      t.integer :ttl
      t.integer :prio
      t.integer :change_date
      t.string :ordername
      t.boolean :auth
    end
    add_index :records, :domain_id
    add_index :records, :name
    add_index :records, [:name,:type]
    add_index :records, :ordername
    execute "ALTER TABLE records ADD FOREIGN KEY (domain_id) REFERENCES domains(id);"
  end
  def down
    drop_table :records
  end
end