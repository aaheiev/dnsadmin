class ChangeDomainTypeToTitle < ActiveRecord::Migration
  def up
    rename_column :domain_types, :domain_type, :title
  end

  def down
    rename_column :domain_types, :title, :domain_type
  end
end
