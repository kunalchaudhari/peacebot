class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :password
      t.boolean :anonymous
      t.string :ip_address

      t.timestamps
    end
  end
end
