class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :user_name
      t.string :phone

      t.timestamps null: false
    end
  end
end
