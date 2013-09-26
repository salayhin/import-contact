class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']

  end

  def invite_friends

    @contacts = params[:email]

    @contacts.each do |value|
      @name  = value.first
      @email = value.last
      SendEmail.invite_friends(@contacts).deliver

    end

    redirect_to({:action => :index}, :flash => {:enquiry => 'Your message has been sent'})
    return true

    #Invite.send_email(@contacts)

  end

end
