class Invitation < ApplicationRecord
    belongs_to :inviter, class_name: "User"
    belongs_to :invitee, class_name: "User"
    belongs_to :event
    validates :event_id, presence: true, uniqueness: { scope: [:invitee_id] }
end
