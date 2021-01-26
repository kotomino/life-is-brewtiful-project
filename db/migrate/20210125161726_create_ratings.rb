class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :comment
      t.integer :user_id
      t.integer :brewery_id

      t.timestamps
    end
  end
end
