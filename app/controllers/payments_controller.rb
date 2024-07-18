class PaymentsController < ApplicationController

  def create
    p 44444444444444444444
    p current_user
    p 44444444444444444444
      customer = Stripe::Customer.create(
        name: current_user.firstname,
        email: current_user.email,
        description: "Customer id: #{current_user.id}",
      )
  
      session = Stripe::Checkout::Session.create( 
        customer: customer.id, 
        payment_method_types: ['card'],
        line_items: [{
          price: 'price_1234', # price API id usually starts with price_ApIiD
          quantity: 1,
        }],
        mode: 'subscription',
        success_url: payments_success_url,
        cancel_url: payments_cancel_url
      )
      redirect_to session.url
  end

  private

  def set_stripe_api_key
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end
  
  def success
    # Handle successful payments
    redirect_to root_url, notice: "Purchase Successful"
  end
  
  def cancel
    # Handle if the payment is cancelled
    redirect_to root_url, notice: "Purchase Unsuccessful"
  end
end
