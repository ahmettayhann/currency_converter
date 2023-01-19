class CreateIntegrations < ActiveRecord::Migration[6.1]
  def change
    create_table :integrations do |t|
      t.string :name
      t.string :type
      t.datetime :activation_date
      t.timestamps
    end
  end
end
