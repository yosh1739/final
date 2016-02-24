class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :body
      t.integer :good
      t.integer :bad
      t.string :comment
      t.timestamps null: false
    end
  end
end
