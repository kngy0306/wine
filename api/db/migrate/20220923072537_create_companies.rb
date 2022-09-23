class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name_ja, limit: 128, default: "", null: false
      t.string :company_name_en, limit: 128, default: "", null: false
      t.string :company_name_noprefix, limit: 128, default: "", null: false
      t.text :address
      t.string :representative, limit: 64, default: "", null: false
      t.string :listed_at, limit: 128, default: "", null: false
      t.integer :capital, limit: 8
      t.integer :founded_at, limit: 2
      t.text :page_url
      t.integer :profit, limit: 8
      t.integer :number_of_employees

      t.timestamps
    end
  end
end
