class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :travel_id
      t.string :name
      t.text :description
      t.string :activity_type
      t.string :lieu
      t.decimal :cost_activity, :precision => 8, :scale => 2, :default => 0
      t.datetime :start_activity
      t.datetime :end_activity

      t.timestamps
    end
  end
end
