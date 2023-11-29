class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
