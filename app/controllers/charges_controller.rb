class ChargesController < ApplicationController

	before_action :permit_param
	def create(stripeEmail, stripeToken)
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
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

	


end
