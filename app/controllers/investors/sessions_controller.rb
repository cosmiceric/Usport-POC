class Investors::SessionsController < Devise::SessionsController
  layout 'investors'

private
    def investor_params
      params.require(:investor).permit(:email,:password,:remember_me)
    end
end
