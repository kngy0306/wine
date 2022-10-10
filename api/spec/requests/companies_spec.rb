require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    it "GETメソッドで/companiesにアクセスし、指定した数の値が返ってくること" do
      FactoryBot.create_list(:company, 3)

      get '/companies'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(3)
    end
  end

  describe "GET /companies/:id" do
    it "特定のcompaniesを取得する" do
      company = Company.create(
        company_name_ja: "株式会社ワイン555",
        company_name_en: "wine555 Ltd.",
        company_name_noprefix: "ワイン555",
        address: "東京都渋谷区松濤",
        representative: "和院555",
        listed_at: "東証プライム",
        capital: 30000000,
        founded_at: 2003,
        page_url: "http://example.com",
        profit: 11600000000,
        number_of_employees: 150
      )

      FactoryBot.create_list(:company, 3)

      get "/companies/#{company.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['company_name_ja']).to eq(company.company_name_ja)
    end
  end
end
