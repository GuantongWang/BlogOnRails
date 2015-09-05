class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.boolean :is_draft
      t.boolean :is_recommend, null: false, default: false
      t.integer :like, null: false, default: 0
      t.integer :view, null: false, default: 0

      t.timestamps null: false
    end
  end
end
