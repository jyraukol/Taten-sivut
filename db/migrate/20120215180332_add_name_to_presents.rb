class AddNameToPresents < ActiveRecord::Migration
  def change
    add_column :presents, :name, :string

  end
end
