# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'igallery@lol.com'
  layout 'mailer'
end
