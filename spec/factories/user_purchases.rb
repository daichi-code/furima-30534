FactoryBot.define do
  factory :user_purchases do
    token { 'sample.token' }
    postal_code { '123-5678' }
    prefecture_id { 2 }
    municipalities { '香' }
    address { '甲' }
    phone_number { 12_345_678_901 }
  end
end
