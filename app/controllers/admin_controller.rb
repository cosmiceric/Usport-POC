class AdminController < ApplicationController

  before_filter :authenticate_investor!
  before_filter :is_admin?

  layout 'investors'
  def approve_investors

    if !params[:investor_id].blank?
      investor = Investor.find params[:investor_id]
      investor.update_attribute('approved', !investor.approved)
      investor.save
      if investor.approved
        InvestorMailer.account_approved(investor).deliver
      end
    end


    if !params[:investor_admin_id].blank?
      investor = Investor.find params[:investor_admin_id]
      investor.update_attribute('admin', !investor.admin)
      investor.save
    end

    if params[:approved] == "false"
      @investors = Investor.find_all_by_approved(false)
    else
      @investors = Investor.all
    end

  end

end
