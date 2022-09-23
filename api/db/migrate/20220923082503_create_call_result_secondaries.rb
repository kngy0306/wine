class CreateCallResultSecondaries < ActiveRecord::Migration[6.1]
  def change
    create_table :call_result_secondaries do |t|
      t.string :result_secondary_option, default: "", null: false

      t.timestamps
    end
  end
end
