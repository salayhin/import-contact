class InvitesController < ApplicationController
  require "net/http"
  require "open-uri"
  require 'digest/sha2'
  require 'digest'

  def index
    session[:testing] = Time.now
    #sha256 = Digest::SHA2.new(256)
    #sha256.digest("Bond, James Bond")
    #password = "44ffa2a3ce881ff404c3f67a44616fd5bcf6d35b7b02a106169dacbd6b75fe28"
    #hash = Digest::SHA256.hexdigest(password)
    #puts hash
    @contacts = request.env['omnicontacts.contacts']
  end

  def contacts_callback
    @contacts = request.env['omnicontacts.contacts']


  end

  def invite_friends
    puts session[:testing]
    #@contacts = params[:email]
    #
    #@contacts.each do |value|
    #
    #  if value.first.present?
    #    @name = value.first
    #  else
    #    @name = value.last.split("@")[0].capitalize
    #  end
    #
    #  @email = value.last
    #  SendEmail.invite_friends(@name, @email).deliver
    #
    #end
    #
    #redirect_to({:action => :index}, :flash => {:enquiry => 'Your message has been sent'})
    return true

    #Invite.send_email(@contacts)

  end

  def twitter_callback
    screen_name = env["omniauth.auth"]["extra"]["raw_info"]["screen_name"]
    oauth_token = env["omniauth.auth"]["extra"]["access_token"].params["oauth_token"]
    oauth_token_secret = env["omniauth.auth"]["extra"]["access_token"].params["oauth_token_secret"]
    user_id = env["omniauth.auth"]["uid"]

    client = Twitter.configure do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.oauth_token         = oauth_token
      config.oauth_token_secret  = oauth_token_secret
    end



    tweet = "I'm advertising my car on Orto Cars."

    client.update(tweet)

  end

  def send_message_twitter

    @contacts = params[:id]

    @contacts.each do |value|
      Twitter.direct_message_create(value, "message")
    end

  end


end
