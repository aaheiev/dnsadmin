class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :done, default: false
      t.string :name, null: false
      t.text :notes
      t.integer :priority, default: 0
      t.date :due
      t.timestamps
    end
    add_index :tasks, :name
  end
end
