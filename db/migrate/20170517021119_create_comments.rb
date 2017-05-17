class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.integer :post_id, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts
  end
end
