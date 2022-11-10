class UsersMailer < ApplicationMailer
    def wakeup(user)
        @user = user
        mail(to: 'test@usermail.com', subject: 'Test Email for Letter Opener')
    end
end 