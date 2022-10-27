class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :role, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :password
      t.date :birthdate
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
