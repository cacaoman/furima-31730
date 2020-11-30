FactoryBot.define do
  factory :item do
    name                { 'matuzakisigeru' }
    description         { '松崎しげる' }
    category_id         { 2 }
    state_id            { 2 }
    delivery_charge_id  { 2 }
    time_to_ship_id     { 2 }
    ship_from_id        { 2 }
    price               { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
