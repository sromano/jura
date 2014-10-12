class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :career_ids
      t.datetime :deleted_at
      t.timestamps
      t.index :deleted_at
      t.index :dni
    end
  end
end
