class DefaultValueToReserved < ActiveRecord::Migration
  def up
    change_column(:presents, :reserved, :boolean, :default => false)
  end

  def down
  end
end
