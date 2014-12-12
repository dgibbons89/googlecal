class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :time1
      t.date :time2
      t.string :details
      t.integer :calendar_id

      t.timestamps
    end
  end
end
