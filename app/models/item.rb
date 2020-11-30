class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :time_to_ship
  belongs_to_active_hash :ship_from
  has_one :order

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :state
    validates :delivery_charge
    validates :time_to_ship
    validates :ship_from
    validates :image
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_charge_id
    validates :time_to_ship_id
    validates :ship_from_id
  end
end
