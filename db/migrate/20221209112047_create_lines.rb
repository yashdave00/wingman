class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.text :line_text
      t.boolean :is_used
      t.string :source
      t.timestamps
    end
  end
end
