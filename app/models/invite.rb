class Invite < ActiveRecord::Base

  def send_email(contacts)
    SendEmail.invite_friends(contacts).deliver
    return true
  end
end