class StripePoc
	def create(stripeEmail, stripeToken)
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => stripeEmail,
	    :source  => stripeToken
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
		puts e.messages
	  #flash[:error] = e.message
	  #redirect_to new_charge_path
	end


	def calCreate
		#generate stripe token
		token =	Stripe::Token.create(
		  :card => {
		    :number => "4242424242424242",
		    :exp_month => 2,
		    :exp_year => 2018,
		    :cvc => "314"
		  },
		)
		self.create('padhu@gmail.com', token)
	end
end