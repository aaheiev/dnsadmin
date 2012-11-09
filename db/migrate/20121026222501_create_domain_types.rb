class CreateDomainTypes < ActiveRecord::Migration
  def change
    create_table :domain_types do |t|
      t.string :domain_type, :null => false
    end
    add_index :domain_types, :domain_type, :unique => true
  end
end