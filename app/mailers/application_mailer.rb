# frozen_string_literal: true

# This class serves as the base class for all mailers in the application.
# It inherits from `ActionMailer::Base`.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
