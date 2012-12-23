class OrderMailer < ActionMailer::Base
  default from: "pcerioli3@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(sandwich, order)
    @sandwich = sandwich
    @order = order

    mail to: "pcerioli2@gmail.com", subject: "New Order"
  end

end
