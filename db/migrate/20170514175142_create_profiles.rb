class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :img_url
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
