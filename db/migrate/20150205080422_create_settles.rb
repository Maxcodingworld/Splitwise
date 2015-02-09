class CreateSettles < ActiveRecord::Migration
  def change
    create_table :settles do |t|
      t.integer :payer
      t.integer :payee
      t.integer :amount
      t.integer :status

      t.timestamps
    end
  end
end
