# this creates a foreign key relationship between user and phones tables, this file was created while executing the migration within terminal. ie. add_reference :phones, :user and foreign_key. index: true implies lookup times faster in the database. we did this and now have a user id colomn in the phones table.
class AddUsersToPhones < ActiveRecord::Migration
  def change
    add_reference :phones, :user, index: true, foreign_key: true
  end
end
