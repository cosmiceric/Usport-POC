class Investor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_create :send_admin_mail
  
  def send_admin_mail
    if Investor.count < 4
      self.admin!
    end
    if User.count == 0
      User.create(
        :email => 'first_user@coincidence.net',
        :password => 'testme123',
        :password_confirmation => 'testme123'
      )
    end
    InvestorMailer.new_investor_waiting_for_approval(self).deliver
    InvestorMailer.approval_pending(self).deliver
  end
  
  def active_for_authentication? 
    super && approved? 
  end 

  def admin!
    self.approved!
    self.update_attribute('admin',true)
  end

  def approved!
    self.update_attribute('approved',true)
  end


  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

end
