# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	
	default from: "from@example.com"

	def contact_form(email, name, message)
	@message = message
		mail(from: email,
			to: 'ulf.schuster@gmail.com',
			subject: "A new contact form message from #{name}")
		UserMailer.contact_form(@email, @name, @message)
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end