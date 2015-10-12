class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.date :post_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
