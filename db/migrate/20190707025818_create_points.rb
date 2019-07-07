class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.decimal   :longitube, :precision => 9, :scale => 6, null: false
      t.decimal   :latitude, :precision => 9, :scale => 6, null: false
      t.integer :bird_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
