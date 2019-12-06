class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Account created"
            login(@user)
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @created_events = @user.created_events.all
        @upcoming_events = @user.attended_events.upcoming
        @prev_events = @user.attended_events.previous
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password)
        end
end
