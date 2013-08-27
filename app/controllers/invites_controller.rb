class InvitesController < ApplicationController

  def index
    @contacts = request.env['omnicontacts.contacts']
    respond_to do |format|
      format.html
    end
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']
    #@user = request.env['omnicontacts.user']
    puts YAML::dump(@contacts)
    #puts YAML::dump(@user)
    #puts "List of contacts of #{@user[:name]} obtained from #{params[:importer]}:"

  end

end
