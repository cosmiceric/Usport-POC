class Users::SessionsController < Devise::SessionsController
  layout false

private
    def user_params
      params.require(:investor).permit(:email,:password,:remember_me)
    end
end
