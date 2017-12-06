class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    #byebug
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price).to_i, 
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        receipt_email: params[:stripeEmail]
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id,
      total: @product.price.to_i)
      UserMailer.order_placed(@user, @product).deliver_now
    end
    

    rescue Stripe::CardError => e
    # When the card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      flash[:notice] = "Please try again"
    end
  end
end
