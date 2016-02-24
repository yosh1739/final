class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contibutions do |t|
      t.string :comment
      t.timestamps null: false
    end
  end
end
