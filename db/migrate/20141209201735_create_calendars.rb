class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer :zip
      t.integer :year
      t.string :district
      t.string :event
      t.date :time1
      t.date :time2
      t.string :details

      t.timestamps
    end
  end
end
