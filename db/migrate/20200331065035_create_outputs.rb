class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.text :review, null: false
      t.string :youtube_url, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :tweet_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
