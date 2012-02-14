class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.text :description
      t.boolean :reserved
      t.integer :reserver

      t.timestamps
    end
  end
end
