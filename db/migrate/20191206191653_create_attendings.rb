class CreateAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :attendings do |t|
      t.belongs_to :attendee, class_name: "User"
      t.belongs_to :attended_event, class_name: "Event"
      t.timestamps
    end
  end
end
