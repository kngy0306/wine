class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 64, default: "", null: false
      t.string :email, limit: 128, default: "", null: false
      t.string :password, default: "", null: false
      
      t.timestamps
    end
  end
end
