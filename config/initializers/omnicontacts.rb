require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "819494646461.apps.googleusercontent.com", "56ewhQrGyVDlMFp6TDWlwyJB", {:redirect_path => "/oauth2callback"}
  importer :yahoo, "dj0yJmk9TWFlM3FobzVWR1JVJmQ9WVdrOVZUbHVRalEzTTJVbWNHbzlNVFU0TWpneE56WXkmcz1jb25zdW1lcnNlY3JldCZ4PWMy", "13698743f814a9528e0387fc18875d24c4668a1d", {:callback_path => '/contacts/yahoo/callback'}
  importer :hotmail, "00000000441006AC", "fg148d07CTyAdmL2zfDaxFBYZ65wQ2da"
end
