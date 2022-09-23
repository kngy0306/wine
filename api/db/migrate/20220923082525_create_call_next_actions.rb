class CreateCallNextActions < ActiveRecord::Migration[6.1]
  def change
    create_table :call_next_actions do |t|
      t.string :next_action_option, default: "", null: false

      t.timestamps
    end
  end
end
