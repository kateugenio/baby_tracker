class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.integer :amount
      t.string :measurement
      t.string :food

      t.timestamps
    end
  end
end
