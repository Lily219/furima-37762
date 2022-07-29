FactoryBot.define do
  factory :order_address do
    postcode             { '123-4567' }
    area_id              { 3 }
    municipality         { '港区' }
    block_num            { '芝浦1' }
    building             { 'aaaaa' }
    phone_num            { '0312345678' }
    token                {"tok_abcdefghijk00000000000000000"}
  end

end
