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
      @user1 = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      @user2 = User.create(first_name: 'Homer', last_name: 'Greek', email: 'ULYSSES@email.com', password: 'Odyssey', password_confirmation: 'Odyssey')
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'should not create a new user if password is not set' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: nil, password_confirmation: 'Bloomsday')
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'should not create a new user if password is shorter than 4 characters' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'day', password_confirmation: 'day')
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
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
    it 'should log user in if credentials are correct' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(User.authenticate_with_credentials('ulysses@email.com', 'Bloomsday')).to eq(@user)
    end

    it 'should log user in if password is correct and email has trailing whitespaces' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(User.authenticate_with_credentials('  ulysses@email.com  ', 'Bloomsday')).to eq(@user)
    end

     it 'should log user in if password is correct and email is in a different case' do
      @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
      expect(User.authenticate_with_credentials('ULysseS@email.COM', 'Bloomsday')).to eq(@user)
    end

    it 'should not log user in if email is incorrect' do
    @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
    expect(User.authenticate_with_credentials('odyssey@email.com', 'Bloomsday')).to be_nil
    end

    it 'should not log user in if password is incorrect' do
    @user = User.create(first_name: 'James', last_name: 'Joyce', email: 'ulysses@email.com', password: 'Bloomsday', password_confirmation: 'Bloomsday')
    expect(User.authenticate_with_credentials('ulysses@email.com', 'Doomsday')).to be_nil
    end
  end
end
