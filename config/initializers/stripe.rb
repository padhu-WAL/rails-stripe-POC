Rails.configuration.stripe = {
  :publishable_key => 'pk_test_qyiJIlc2jm7QuNumP3BWqzoE',
  :secret_key      => 'sk_test_RYwXnaKvXMC0NEmMMm3SUCAb'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]