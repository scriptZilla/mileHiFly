class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :insect_type
      t.string :time_of_year
      t.string :fish
      t.text :description

      t.timestamps
    end
  end
end
