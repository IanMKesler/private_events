class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.belongs_to :inviter, class_name: "User"
      t.belongs_to :invitee, class_name: "User"
      t.belongs_to :event
      t.timestamps
    end
  end
end
