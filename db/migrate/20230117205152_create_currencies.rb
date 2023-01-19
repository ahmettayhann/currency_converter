class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :iso
      t.string :base
      t.float :rate
      t.datetime :rate_date

      t.timestamps
    end
  end
end
