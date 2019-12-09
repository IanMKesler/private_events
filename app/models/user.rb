class User < ApplicationRecord
    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
    has_many :attendings, foreign_key: "attendee_id"
    has_many :attended_events, through: :attendings
    has_many :invitations, foreign_key: "invitee_id"
    has_many :sent_invitations, foreign_key: "inviter_id", class_name: "Invitation"
    has_secure_password
end
