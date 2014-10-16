class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.string :name
      t.text :text
      t.integer :code
      t.timestamps
    end
  end
end
