Rails.configuration.stripe = {
  publishable_key: ENV["Spk_test_51Pd7bUBRmuyP1wGTzViZ0xWpZPwb6wpttjgUfWTd0orHw3xF6Tdx7BcJhWbUKQPR4ZI1ldwXGWvw4fJxFqDH3q5u007A4GAxK8TRIPE_PUBLISHABLE_KEY"],
  secret_key: ENV["STRIPE_SECsk_test_51Pd7bUBRmuyP1wGTCvi2W3Y83yzs8hIOO4xKEFdJiuwdb2uTMhcouNyp2ID2Zmro0s2GL0EtXPLxed4sQJ4aweFb00V5f7WrYuRET_KEY"]
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]