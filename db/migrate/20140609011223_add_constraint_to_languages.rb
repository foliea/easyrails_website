class AddConstraintToLanguages < ActiveRecord::Migration
  def up
    change_column :languages, :name, :string, null: false
    change_column :languages, :locale, :string, null: false
  end

  def down
    change_column :languages, :name, :string
    change_column :languages, :locale, :string
  end
end
