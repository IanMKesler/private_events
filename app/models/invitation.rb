class Invitation < ApplicationRecord
    belongs_to :inviter, class_name: "User"
    belongs_to :invitee, class_name: "User"
    belongs_to :event
    validate :not_attending
    validates :event_id, presence: true, uniqueness: { scope: [:invitee_id] }
    
    

    def not_attending
        errors.add(:invitee_id, "Cannot already be attending the event") if Attending.where(attendee_id: invitee_id, attended_event_id: event_id).exists?
    end
end
