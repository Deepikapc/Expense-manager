class DailyInvoice < ApplicationRecord
  acts_as_paranoid

  has_many :expenses, :dependent => :destroy

  validates_presence_of :restaurant_name
  validates_presence_of :amount
  validates_presence_of :date

  has_attached_file :image

  do_not_validate_attachment_file_type :image
  accepts_nested_attributes_for :expenses

end
