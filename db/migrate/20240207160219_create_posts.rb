class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
