class CreateCallResults < ActiveRecord::Migration[6.1]
  def change
    create_table :call_results, primary_key: :call_id do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :call_result_primary, null: false, foreign_key: true
      t.references :call_result_secondary, null: false, foreign_key: true
      t.references :call_next_action, null: false, foreign_key: true
      t.datetime :next_action_date
      t.string :memo

      t.timestamps
    end
  end
end
