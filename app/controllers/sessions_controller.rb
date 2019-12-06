class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user
            login(@user)
            flash[:success] = "Signed in"
            redirect_to @user
        else
            flash.now[:danger] = "Cannot find user"
            render 'new'
        end
    end

    def destroy
        logout if logged_in?
        flash[:success] = "Logged out"
        redirect_to root_url
    end


    private

        def session_params
            require(:session).permit(:email)
        end
end
