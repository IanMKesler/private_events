class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date
      t.belongs_to :creator, class_name: "User"

      t.timestamps
    end
  end
end
