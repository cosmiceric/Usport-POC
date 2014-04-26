class InvestorMailer < ActionMailer::Base
  default from: "SportsRnD <noreply@coincidence.net>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_user_waiting_for_approval.subject
  #
  def new_investor_waiting_for_approval(investor)
    @to = Rails.env == "development" ? "quinn@coincidence.net" : ADMIN_EMAILS
    @greeting = "Hi"
    @investor = investor
    @url = SERVER + '/admin/approve_investors'
    mail(:to => @to, :subject => "New investor #{investor.email} awaiting approval!")
  end

  def approval_pending(investor)
    @greeting = "Hi"
    @investor = investor
    mail to: investor.email, subject: "Your Account is Awaiting Approval"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investor_mailer.account_approved.subject
  #
  def account_approved(investor)
    @greeting = "Hi"
    @investor = investor
    @url = SERVER
    mail to: investor.email, subject: "Your Account has been Approved"
  end

end
