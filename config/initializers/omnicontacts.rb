require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "819494646461.apps.googleusercontent.com", "56ewhQrGyVDlMFp6TDWlwyJB", {:redirect_path => "/oauth2callback"}
  importer :yahoo, "dj0yJmk9WUtOV3RlYzVPR3ZnJmQ9WVdrOWJGTjBNamw0TlRRbWNHbzlNakV6T0RVd01UUTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD01NA--", "a89e30c061dd2dab447f3280f20b9cef5ea8ecf3", {:callback_path => '/contacts/yahoo/callback'}
  importer :facebook, "165217670339554", "eccb6b09dfad16595f3aca252a85ad01"
end
