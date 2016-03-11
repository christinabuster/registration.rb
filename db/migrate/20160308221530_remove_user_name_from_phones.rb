class RemoveUserNameFromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :user_name, :string
  end
end
