class PaymentsController < ApplicationController
  def new
  end
  def create
    source = Stripe::Source.create({
                                     type: 'ach_credit_transfer',
                                     currency: 'usd',
                                     owner: {
                                       email: current_user.email,
                                     },
                                   })

    customer = Stripe::Customer.create({
                                         name: current_user.firstname,
                                         email: current_user.email,
                                         source: source.id,
                                         description: "Customer id: #{current_user.id}"
                                       })

    subscription = Stripe::Subscription.create({
                                                 customer: customer.id,
                                                 items: [{ price: 'price_1PdsQ2BRmuyP1wGTdhy7k69G' }],
                                               })

    session = Stripe::Checkout::Session.create({
                                                 customer: customer.id,
                                                 payment_method_types: ['card'],
                                                 line_items: [{
                                                                price: 'price_1PdsQ2BRmuyP1wGTdhy7k69G',
                                                                quantity: 1,
                                                              }],
                                                 mode: 'subscription',
                                                 success_url: root_path(payment_status: "success"),
                                                 cancel_url: root_path(payment_status: "cancel")
                                               })
    redirect_to session.url, allow_other_host: true
  end
end