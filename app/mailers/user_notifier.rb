class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.added_to_project.subject
  #
  def added_to_project
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
