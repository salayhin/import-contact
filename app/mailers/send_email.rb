class SendEmail < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_email.invite_friends.subject
  #

  def invite_friends(name, email)

    @name  = name
    @email = email
    to = "#{@name} <#{@email}>"
    from = ['do-not-reply@salayhin.wordpress.com']

      mail :to => to, :subject => 'Invitation to join', :from => from do |format|
        format.html
      end

  end
end
