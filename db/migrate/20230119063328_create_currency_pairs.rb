class CreateCurrencyPairs < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_pairs do |t|
      t.integer :base_currency_id
      t.integer :compared_currency_id

      t.timestamps
    end
  end
end
