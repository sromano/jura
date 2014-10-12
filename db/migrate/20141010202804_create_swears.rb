class CreateSwears < ActiveRecord::Migration
  def change
    create_table :swears do |t|
      t.date :inscription_date
      t.date :swear_date
      t.integer :quota
      t.integer :used_quota, default: 0
      t.boolean :enabled, default: true
      t.timestamps
    end
  end
end
