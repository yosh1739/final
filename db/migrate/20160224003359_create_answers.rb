class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :comment
      t.string :agree
      t.timestamps null: false
    end
  end
end
