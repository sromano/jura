class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|
      t.integer :order
      t.integer :swear_id
      t.integer :formula_id
      t.integer :graduate_id
      t.string :email
      t.timestamps
    end
  end
end
