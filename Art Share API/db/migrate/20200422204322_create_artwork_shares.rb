class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, index: true, null: false
      t.integer :viewer_id, index: true, null: false

      t.timestamps
    end
  end
end
