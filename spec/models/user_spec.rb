require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user successfully with all fields set' do
      # .create Creates an object (or multiple objects) and saves it to the database, if validations pass. The resulting object is returned whether the object was saved successfully to the database or not, while .new only creates the local object but does not attempt to validate or save it to the DB.
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(@user).to be_present
    end

    it 'should not create a new user if first_name is not set' do
      @user = User.create(first_name: nil, last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should not create a new user if last_name is not set' do
      @user = User.create(first_name: 'James', last_name: nil, email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'should not create a new user if email is not set' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: nil, password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should not create a new user if email is not unique' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      @user = User.new(first_name: 'Homer', last_name: 'Greek', email: 'ulysses@email.com', password: 'Odyssey', password_confirmation: 'Odyssey')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end

    it 'should not create a new user if email is the same as existing in db but in different case' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      @user = User.new(first_name: 'Homer', last_name: 'Greek', email: 'ULYSSES@email.com', password: 'Odyssey', password_confirmation: 'Odyssey')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end

    it 'should not create a new user if password is not set' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: nil, password_confirmation: 'Bloomsday')
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'should not create a new user if password_confirmation is not present' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: nil)
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'should not create a new user if password_confirmation is incorrect' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Doomsday')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
