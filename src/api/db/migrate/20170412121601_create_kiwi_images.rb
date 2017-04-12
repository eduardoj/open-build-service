class CreateKiwiImages < ActiveRecord::Migration[5.0]
  def change
    create_table :kiwi_images do |t|
      t.string :name

      t.timestamps
    end
  end
end
