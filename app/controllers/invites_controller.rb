class InvitesController < ApplicationController

  def index
    session[:testing] = "this is a test"
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']

  end

  def invite_friends
    puts session[:testing]
    @contacts = params[:email]

    @contacts.each do |value|

      if value.first.present?
        @name = value.first
      else
        @name = value.last.split("@")[0].capitalize
      end

      @email = value.last
      SendEmail.invite_friends(@name, @email).deliver

    end

    redirect_to({:action => :index}, :flash => {:enquiry => 'Your message has been sent'})
    return true

    #Invite.send_email(@contacts)

  end

end
