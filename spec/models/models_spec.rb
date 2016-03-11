# TODO finish database test, left off testing for nil field
require 'rails_helper'

# testing the database. "models_spec" is the folder, type indicates testing the model.
RSpec.feature "models_spec", type: :model do

  it "should be User info is savable in the database" do
    # truthy = to exist. user_name: relates to the colomn in the table users. tests model, .new creates a new user (user...password) creates parameters/ user.save allows test to save to test database.
    user = User.new(user_name: 'Vincent', password: '1234')
    user.save
    expect(user).to be_truthy
    expect(User.first).to be_a(User)
  end

  it "should store empty input fields as NiL in the database" do
    expect(User.first).to be_nil(User)

  end
end
