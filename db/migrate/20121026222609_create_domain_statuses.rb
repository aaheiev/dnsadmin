class CreateDomainStatuses < ActiveRecord::Migration
  def change
    create_table :domain_statuses do |t|
      t.string :title, :null => false
    end
    add_index :domain_statuses, :title, :unique => true
  end
end
