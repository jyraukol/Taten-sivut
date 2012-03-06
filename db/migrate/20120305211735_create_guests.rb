class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.boolean :attending
      t.references :user

      t.timestamps
    end
    add_index :guests, :user_id
  end
end
