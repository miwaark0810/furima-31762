FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '12345678910' }
  end
end
