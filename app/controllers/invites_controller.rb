class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']

  end

  def invite_friends

    params[:email].each do |value|
      puts value # should print the values for each input
    end
    #Invite.send_email

    #SendEmail.invite_friends().deliver
    #return true
  end

end
