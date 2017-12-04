class ApplicationMailer < ActionMailer::Base
  default from: 'ulf.schuster@gmail.com'

  layout "mailer"
end


#class ApplicationMailer < ActionMailer::Base
  #default from: 'from@example.com'
  #layout 'mailer'

  #def thank_you
		#@name = params[:name]
		#@email = params[:email]
		#@message = params[:message]
		#ActionMailer::Base.mail(from: @email,
			#to: 'ulf.schuster@gmail.com',
			#subject: "A new contact form message from #{@name}",
			#body: @message).deliver_now
	#end
#end