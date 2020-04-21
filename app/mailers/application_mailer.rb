# frozen_string_literal: true

# class ApplicationMailer < ActionMailer::Base
class ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'
end
