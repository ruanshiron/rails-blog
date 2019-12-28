class CreateCovers < ActiveRecord::Migration[5.2]
  def change
    create_table :covers do |t|
      t.string :picture
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :covers, [:post_id, :created_at]
  end
end
