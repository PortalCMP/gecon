class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :gender
      t.date :birth_date
      t.string :cellphone
      t.string :email
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
