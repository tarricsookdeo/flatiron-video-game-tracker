class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :publisher
      t.string :rating
      t.integer :year_released
      t.integer :user_id
    end
  end
end
