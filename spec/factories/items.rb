FactoryBot.define do
  factory :item do
    title             {"aaaaa"}
    price             {2000}
    description       {"aaa"}
    category_id       {2}
    delivery_day_id   {2}
    delivery_fee_id   {2}
    area_id           {2}
    condition_id      {2}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
    
  end
end
