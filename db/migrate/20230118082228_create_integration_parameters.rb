class CreateIntegrationParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :integration_parameters do |t|
      t.integer :integration_id
      t.string :name
      t.string :value
      t.timestamps
    end
  end
end
