class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.time :date_submitted
      t.integer :status, default: 0
      t.decimal :subtotal
      t.decimal :shipping, default: 0
      t.decimal :tax, default: 0
      t.decimal :total
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
