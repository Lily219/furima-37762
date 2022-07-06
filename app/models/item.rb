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
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :description, presence: true
  validates :image, presence: true
 

end
