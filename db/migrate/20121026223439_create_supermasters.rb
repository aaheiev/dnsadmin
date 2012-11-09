class CreateSupermasters < ActiveRecord::Migration
  def change
    create_table :supermasters do |t|
      t.string :ip, :limit => 16
      t.string :nameserver
      t.string :account, :limit => 40
    end
  end
end
