class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.integer :user_id
      t.string :spotify_url
      t.text :message
      t.boolean :public
      t.string :password
      t.string :name

      t.timestamps
    end
  end
end
