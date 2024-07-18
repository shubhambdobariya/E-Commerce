Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
Rails.logger.debug "Stripe API key: #{Stripe.api_key}"

