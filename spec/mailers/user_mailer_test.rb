class UserMailerTest < UserMailerPreview
	default from: "ulf.schuster@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(from: email,
			to: 'ulf.schuster@gmail.com',
			subject: "A new contact form message from #{name}")
		UserMailerTest.contact_form(@email, @name, @message)
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailerTest.contact_form(@email, @name, @message).deliver_now
	end
end