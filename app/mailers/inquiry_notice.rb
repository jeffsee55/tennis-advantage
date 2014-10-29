class InquiryNotice < ActionMailer::Base
  default from: "inquiries@tennis_advantage.com"

  def inquiry_email(inquiry)
    email_address = "jeffsee.55@gmail.com"
    mail(
      to: email_address,
      subject: "This is a test email"
    )
  end
end
