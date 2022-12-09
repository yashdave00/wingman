class CreateLineTags < ActiveRecord::Migration[6.0]
  def change
    create_table :line_tags do |t|
      t.string :slug
      t.string :display_name
      t.timestamps
    end
  end
end
