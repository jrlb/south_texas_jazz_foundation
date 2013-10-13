Stripe.api_key = ENV['STRIPE_SECRET_KEY']
STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLISHABLE_KEY']

StripeEvent.setup do
  subscribe 'customer.created', 'customer.updated' do |event|
    logger.info = event.type
    logger.info = event.description
  end
end
