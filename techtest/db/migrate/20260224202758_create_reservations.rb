class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :book, null: false, foreign_key: true
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
