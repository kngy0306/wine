class CreateCallResultPrimaries < ActiveRecord::Migration[6.1]
  def change
    create_table :call_result_primaries do |t|
      t.string :result_primary_option, default: "", null: false

      t.timestamps
    end
  end
end
