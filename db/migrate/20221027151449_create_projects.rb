class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :post, null: false, foreign_key: true
      t.string :status
      t.json :events

      t.timestamps
    end
  end
end
