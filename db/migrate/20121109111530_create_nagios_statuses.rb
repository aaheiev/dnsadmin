class CreateNagiosStatuses < ActiveRecord::Migration
  def change
    create_table :nagios_statuses do |t|
      t.references :statusable, :polymorphic => true
      t.references :monitor
      t.string :event_type
      t.string :event_status
      t.string :event_message
      t.timestamp :event_time

      t.timestamps
    end
    add_index :nagios_statuses, :statusable_id
    add_index :nagios_statuses, :monitor_id
    add_index :nagios_statuses, :created_at
  end
end
