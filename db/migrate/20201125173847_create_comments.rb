class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :author, null: false, index: true, foreign_key: { to_table: :users }
      t.belongs_to :post_id, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
