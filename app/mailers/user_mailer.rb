class UserMailer < ApplicationMailer
  default from: 'shubhamd.essence@gmail.com'

  def welcome_email(user, developer)
    @user = user
    @developer = developer
    mail(to: 'test-random-41554@yopmail.com', subject: 'New Developer Created')
  end

  def product_creation_email(user, product)
    @user = user
    @product = product
    mail(to: user.email, subject: 'New Product Created')
  end
end
