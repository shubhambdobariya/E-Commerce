class SendWelcomeEmailWorker
  include Sidekiq::Worker

  def perform(user_id, developer_id)
    user = User.find(user_id)
    developer = Developer.find(developer_id)
    UserMailer.welcome_email(user, developer).deliver_now
  end
end
