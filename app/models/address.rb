class Address < ApplicationRecord
  def full_address
    '〒' + postcode + ' ' + address + ' ' + name
  end
belongs_to :customer
end
