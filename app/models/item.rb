class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :deliveryFee
  belongs_to :condition
  belongs_to :deliveryDay
  belongs_to :area

  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :description, presence: true
  validates :image, presence: true
end
