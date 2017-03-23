class UserPayment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_mode
end
