class CreateMyObjects < ActiveRecord::Migration
  def change
    create_table :my_objects do |t|
      t.string :color
      t.timestamps null: false
    end
  end
end
