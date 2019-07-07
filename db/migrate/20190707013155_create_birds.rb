class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string  :name, null: false, index: true
      t.text    :imformation, null: true
      t.string  :image, null: true
      t.timestamps
    end
  end
end
