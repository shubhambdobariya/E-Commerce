class SendProductCreationEmailJob < ApplicationJob
  queue_as :emails

  def perform(user_id, product_id)
    user = User.find(user_id)
    product = Product.find(product_id)
    UserMailer.product_creation_email(user, product).deliver_now
  end
end