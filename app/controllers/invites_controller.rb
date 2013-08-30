class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']

  end

end
