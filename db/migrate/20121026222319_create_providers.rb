class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :title, null: false
      t.string :site_url
      t.string :cp_url
      t.string :cp_username
      t.string :cp_password
      t.string :email
      t.text :comments

      t.timestamps
    end
    add_index :providers, [:title,:cp_username], :unique => true
  end
end
