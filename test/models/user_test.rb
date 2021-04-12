require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.email = 'hello@example.com'
    user.password = '12345678'
    user.save
    assert user.valid?
  end

  test 'should not save user without email' do
    user = User.new
    user.password = 'thisIsAPassword'
    user.save
    refute user.valid?
  end

  test 'should not save user without password' do
    user = User.new
    user.email = 'userOne@example.com'
    user.save
    refute user.valid?
  end
end
