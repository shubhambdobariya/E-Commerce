# config/initializers/exception_notification.rb

require "exception_notification/rails"
require 'slack-notifier'

ExceptionNotification.configure do |config|
  config.add_notifier :email, {
    email_prefix: "[ERROR] ",
    sender_address: %("Notifier" <dobariyashubham285@gmail.com>),
    exception_recipients: %w[dobariyashubham285@gmail.com]
  }

  config.add_notifier :slack, {
    webhook_url: "https://hooks.slack.com/services/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",
    channel: "#E-commerce"
  }
end
