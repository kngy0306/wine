FactoryBot.define do
  factory :company do
    company_name_ja { "株式会社ワイン" }
    company_name_en { "wine Ltd." }
    company_name_noprefix { "ワイン" }
    address { "東京都渋谷区松濤" }
    representative { "和飲" }
    listed_at { "東証プライム" }
    capital { 30000000 }
    founded_at { 2003 }
    page_url { "http://example.com" }
    profit { 11600000000 }
    number_of_employees { 150 }
  end
end
