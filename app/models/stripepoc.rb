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
	    :description => 'Rails Stripe POC',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
		puts e.messages
	  #flash[:error] = e.message
	  #redirect_to new_charge_path
	end

	def subscribe(stripeEmail, stripeToken)
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => stripeEmail,
	    :source  => stripeToken
	  )

	  charge = Stripe::Subscription.create(
	    :customer    => customer.id,
	    :plan      => 'premium1'
	  )

	rescue Stripe::CardError => e
		puts e.messages
	  #flash[:error] = e.message
	  #redirect_to new_charge_path
	end

	def charge
		#generate stripe token
		token = self.createToken
		#create a customer and charge
		self.create("padhus#{Time.now.to_i}@gmail.com", token)
	end

	def subCustomer
		#generate stripe token
		token = self.createToken
		#create a customer and subscribe to premium plan
		self.subscribe("padhus#{Time.now.to_i}@gmail.com", token)

	end

	def createToken
		token =	Stripe::Token.create(
		  :card => {
		    :number => "4242424242424242",
		    :exp_month => 2,
		    :exp_year => 2018,
		    :cvc => "314"
		  },
		)
	end
end