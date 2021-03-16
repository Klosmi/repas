class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.integer :number_guest
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
