#require "omnicontacts/middleware/oauth2"
#require "omnicontacts/parse_utils"
#require "json"
#
#module OmniContacts
#  module Importer
#    class Hotmail < Middleware::OAuth2
#      include ParseUtils
#
#      attr_reader :auth_host, :authorize_path, :auth_token_path, :scope
#
#      def initialize *args
#        super *args
#        @auth_host = "oauth.live.com"
#        @authorize_path = "/authorize"
#        @scope = "wl.signin, wl.basic, wl.birthday , wl.emails ,wl.contacts_birthday , wl.contacts_photos"
#        @auth_token_path = "/token"
#        @contacts_host = "apis.live.net"
#        @contacts_path = "/v5.0/me/contacts"
#      end
#
#      def fetch_contacts_using_access_token access_token, access_token_secret
#        contacts_response = https_get(@contacts_host, @contacts_path, :access_token => access_token)
#        contacts_from_response contacts_response
#      end
#
#      private
#
#      def contacts_from_response response_as_json
#        response = JSON.parse(response_as_json)
#        contacts = []
#        response['data'].each do |entry|
#          # creating nil fields to keep the fields consistent across other networks
#          contact = {:id => nil, :first_name => nil, :last_name => nil, :name => nil, :email => nil, :gender => nil, :birthday => nil, :profile_picture=> nil, :relation => nil, :email_hashes => []}
#          contact[:id] = entry['user_id']
#          if valid_email? entry["name"]
#            contact[:email] = entry["name"]
#          else
#            contact[:first_name] = normalize_name(entry['first_name'])
#            contact[:last_name] = normalize_name(entry['last_name'])
#            contact[:name] = normalize_name(entry['name'])
#          end
#          contact[:birthday] = birthday_format(entry['birth_month'], entry['birth_day'], entry['birth_year'])
#          contact[:gender] = entry['gender']
#          contact[:profile_picture] = 'https://apis.live.net/v5.0/' + entry['user_id'] + '/picture' if entry['user_id']
#          contact[:email_hashes] = entry['email_hashes']
#          contacts << contact if contact[:name] || contact[:first_name]
#        end
#        contacts
#      end
#
#      def escape_windows_format value
#        value.gsub(/[\r\s]/, '')
#      end
#
#      def valid_email? value
#        /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/.match(value)
#      end
#
#    end
#  end
#end

class OmniContacts::Importer::Live < OmniContacts::Importer::Hotmail
  def initialize *args
    super *args
    @auth_host = 'login.live.com' #"oauth.live.com"
    @authorize_path = '/oauth20_authorize.srf' #"/authorize"
    @scope = 'wl.basic, wl.contacts_emails' #"wl.signin, wl.basic, wl.birthday , wl.emails ,wl.contacts_birthday , wl.contacts_photos"
    @auth_token_path = "/oauth20_token.srf"
    @contacts_host = "apis.live.net"
    @contacts_path = "/v5.0/me/contacts"
    @self_path = "/v5.0/me"
  end

  def contacts_from_response response_as_json
    system "echo '#{response_as_json}' > ~/loooogs.text"
    response = JSON.parse(response_as_json)
    contacts = []
    response['data'].each do |entry|
      # creating nil fields to keep the fields consistent across other networks
      contact = {:id => nil, :first_name => nil, :last_name => nil, :name => nil, :email => nil, :gender => nil, :birthday => nil, :profile_picture=> nil, :relation => nil}
      contact[:id] = entry['user_id'] ? entry['user_id'] : entry['id']
      if valid_email? entry["emails"]["preferred"]
        contact[:email] = entry["emails"]["preferred"]
        contact[:first_name], contact[:last_name] = email_to_name(contact[:email])
      else
        contact[:first_name] = normalize_name(entry['first_name'])
        contact[:last_name] = normalize_name(entry['last_name'])
      end
      contact[:name] = normalize_name(entry['name'])
      contact[:birthday] = birthday_format(entry['birth_month'], entry['birth_day'], entry['birth_year'])
      contact[:gender] = entry['gender']
      contact[:profile_picture] = 'https://apis.live.net/v5.0/' + entry['user_id'] + '/picture' if entry['user_id']
      contacts << contact if contact[:name] || contact[:first_name]
    end
    contacts
  end
end