class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :municipality, :block_num, :building, :phone_num, :order_id, :item_id, :user_id, :token

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality 
    validates :block_num
    validates :phone_num, format: {with: /\A\d{10,11}\z/, message: "is invalid" }
    
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, area_id: area_id, municipality: municipality, block_num: block_num, building: building, phone_num: phone_num, order_id: order.id)
  end

end
