class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']

  end

  def invite_friends

    @contacts = params[:email]

    SendEmail.invite_friends(@contacts).deliver
    return true

    #Invite.send_email(@contacts)

  end

end
