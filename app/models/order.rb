class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card:0, transfer:1 }
  enum status: { wating_for_deposit:0, payment_confirmation:1, be_making:2, ready_to_ship:3, has_been_shiped:4}

  def billing_amount
    shipping_cost + total_payment
  end
  
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true

end

