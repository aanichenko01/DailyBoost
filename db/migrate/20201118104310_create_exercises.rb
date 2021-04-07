class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :workout, foreign_key: true, null: false
      t.string :title, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.string :equipment, null: false
      t.string :sets
      t.string :reps

      t.timestamps
    end
  end
end
