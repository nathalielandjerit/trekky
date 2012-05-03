class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :user_id
      t.string :name
      t.string :start_country
      t.string :end_country
      t.date :start_travel
      t.date :end_travel

      t.timestamps
    end
  end
end
