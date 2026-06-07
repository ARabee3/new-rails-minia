class CreatePostEditors < ActiveRecord::Migration[8.1]
  def change
    create_table :post_editors do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :post_editors, [:post_id, :user_id], unique: true
  end
end
