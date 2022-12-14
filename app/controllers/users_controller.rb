class UsersController < ApplicationController
    before_action :set_user, only: [:show,:destroy, :edit, :update, :wakeup]
    def index
        @users = User.includes(:organization).all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(strong_params)

        if @user.save
            redirect_to users_url, flash: {success: 'User saved...'}
        else
            flash[:error] = 'User not saved...'
            render :new
        end
    end
    
    def update
        if @user.update(strong_params)
            redirect_to user_url(@user), flash: {success: "User #{@user.first_name} updated..."}
        else
            flash[:error] = 'User not updated...'
            render :edit 
        end    
    end

    def destroy
        @user.destroy
        redirect_to users_url
    end

    def wakeup
        UsersMailer.wakeup(@user).deliver_now
    end
    private
    def strong_params
        params.require(:user).permit(:first_name, :last_name, :organization_id )
        
    end
    def set_user
        @user = User.find(params[:id])
    end
end
