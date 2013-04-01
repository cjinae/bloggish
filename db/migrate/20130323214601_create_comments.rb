class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post   	#sets up foreign key column for the association between two models

      t.timestamps
    end
    add_index :comments, :post_id   #sets up index for this association column
  end
end
