  class DailyInvoice < ApplicationRecord
    has_many :expenses, :dependent => :destroy
    #belongs_to :user
    validates_presence_of :restaurant_name
    validates_presence_of :amount
    validates_presence_of :date
    has_attached_file :image
    do_not_validate_attachment_file_type :image
    accepts_nested_attributes_for :expenses
    acts_as_paranoid

  end
