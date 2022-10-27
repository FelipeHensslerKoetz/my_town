class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :category
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
