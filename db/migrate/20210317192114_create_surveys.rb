class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.boolean :nut
      t.boolean :peanut
      t.boolean :shellfish
      t.boolean :egg
      t.boolean :fish
      t.boolean :soy
      t.boolean :celery
      t.boolean :sesame_seed
      t.boolean :milk
      t.boolean :sulphite
      t.boolean :mustard
      t.boolean :gluten
      t.boolean :salt
      t.boolean :sugar
      t.boolean :hallal
      t.boolean :casher
      t.boolean :vegan
      t.boolean :vegetarian
      t.text :comment
      t.references :event, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
