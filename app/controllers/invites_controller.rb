class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']
    @contacts.inspect
    abort("Message goes here")

  end

  def invite_friends

    @contacts = params[:email]

    SendEmail.invite_friends(@contacts).deliver
    redirect_to({:action => :index}, :flash => {:enquiry => 'Your message has been sent'})
    return true

    #Invite.send_email(@contacts)

  end

end
