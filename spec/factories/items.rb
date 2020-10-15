FactoryBot.define do
  factory :item do
    title { 'sample' }
    text { 'sample' }
    category_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { 1000 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
