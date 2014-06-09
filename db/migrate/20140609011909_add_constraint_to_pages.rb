class AddConstraintToPages < ActiveRecord::Migration
  def up
    change_column :pages, :name, :string, null: false
    change_column :pages, :locale, :string, null: false
  end

  def down
    change_column :pages, :name, :string
    change_column :pages, :locale, :string
  end
end
