class AttendingsController < ApplicationController
    def create
        invitation = Invitation.find(params[:invitation_id].to_i)
        @attending = Attending.new(attendee_id: invitation.invitee_id, attended_event_id: invitation.event_id)
        if @attending.save
            invitation.destroy
            flash[:success] = "Invitation accepted"
            redirect_to invitation.event
        else
            flash[:danger] = "Invitation cannot be accepted"
            redirect_to invitation.event
        end
    end
end
