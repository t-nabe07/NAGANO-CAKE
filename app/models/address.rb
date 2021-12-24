class Address < ApplicationRecord
  def full_address
    '〒' + postcode + ' ' + address + ' ' + name
  end
belongs_to :customer

validates :postcode, length: {is: 7},presence:true
validates :address,presence:true
validates :name,presence:true

end
