# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact_email
        ContactMailer.contact_email("anastasia@me.com",
        "Anastasia Anichenko", "1234567890", @message = "Hello, I would like to know more about fitness!")
    end
end
