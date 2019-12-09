class InvitationsController < ApplicationController

    def new
        @upcoming_events = current_user.attended_events.upcoming
        @upcoming_events += current_user.created_events.upcoming
    end

    def create
        @user = current_user
        invitation = @user.sent_invitations.build(invite_params)
        if invitation.save
            flash[:success] = "Invite sent"
            redirect_to @user
        else
            flash[:danger] = "Unable to send invitation"
            @upcoming_events = current_user.attended_events.upcoming
            @upcoming_events += current_user.created_events.upcoming
            render 'new'
        end
    end


    private
        def invite_params
            temp = params.require(:invitation).permit(:event_id, :email)
            specs = {}
            specs[:event_id] = temp[:event_id]
            begin
                specs[:invitee_id] = User.find_by(email: temp[:email]).id
            rescue
                specs[:invitee_id] = nil
            end
            specs
        end
end
