class PaymentMode < ApplicationRecord
  has_one :user_payment
end
