require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "819494646461.apps.googleusercontent.com", "56ewhQrGyVDlMFp6TDWlwyJB", {:redirect_path => "/oauth2callback"}
  importer :yahoo, "dj0yJmk9NUU0ckQ2RTVpcExTJmQ9WVdrOVZUbHVRalEzTTJVbWNHbzlNVFU0TWpneE56WXkmcz1jb25zdW1lcnNlY3JldCZ4PTI4", "b69914e48af2c7c677256838a4243b4d3b41e5c4", {:callback_path => '/callback'}
  importer :hotmail, "00000000441006AC", "fg148d07CTyAdmL2zfDaxFBYZ65wQ2da"
end
