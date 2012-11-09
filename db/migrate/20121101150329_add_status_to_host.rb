class AddStatusToHost < ActiveRecord::Migration
  def change
    change_table :hosts do |t|
      t.string :hoststate, :default => 'UP'
    end
    add_index :hosts, :hoststate
  end
end
