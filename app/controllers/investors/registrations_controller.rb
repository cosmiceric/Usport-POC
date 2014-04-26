class Investors::RegistrationsController < Devise::RegistrationsController
  layout 'investors'
  private
  def investor_params
     params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
