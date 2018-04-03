class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.boolean :success
      t.string :token
      t.decimal :amount, default: 0
      t.string :failure_message

      t.timestamps
    end
  end
end
