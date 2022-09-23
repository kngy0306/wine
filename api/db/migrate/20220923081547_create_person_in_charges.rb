class CreatePersonInCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :person_in_charges do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :account_source, limit: 64, default: "", null: false
      t.string :position, limit: 128

      t.timestamps
    end
  end
end
