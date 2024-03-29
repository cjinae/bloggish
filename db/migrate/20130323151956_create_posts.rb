class CreatePosts < ActiveRecord::Migration

  def up
  	create_table :posts do |t|
  		t.string :name
  		t.string :title
  		t.string :content

  		t.timestamps
  	end
  end

  def down
  	drop_table :posts
  end
end
