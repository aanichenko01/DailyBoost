class ApplicationMailer < ActionMailer::Base
  default to: "info@DailyBoost.com", from: 'group8@me.com'
  layout 'mailer'
end
