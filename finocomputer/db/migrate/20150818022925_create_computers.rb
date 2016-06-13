class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :name
      t.integer :modelo
      t.integer :price_cents
    end
  end
end
