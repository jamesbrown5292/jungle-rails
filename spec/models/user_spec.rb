require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should succeed when instantiated correctly ' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      expect(testUser).to be_valid
    end

    it 'should fail when instantiated without a name' do 
      testUser = User.new(:name => nil, :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      expect(testUser.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail when instantiated without an email' do 
      testUser = User.new(:name => "testy", :email => nil, :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      expect(testUser.errors.full_messages).to include("Email can't be blank")
    end

    it 'should fail when instantiated with a password that is too short' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin", :password_confirmation => "admin")
      testUser.save
      puts testUser.errors.full_messages
      expect(testUser.errors.full_messages).to include("Password confirmation is too short (minimum is 8 characters)")
    end

    it 'should fail when instantiated with no password ' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => nil, :password_confirmation => "admin1234")
      testUser.save
      expect(testUser.errors.full_messages).to include("Password can't be blank")
    end

    it 'should fail when instantiated with no password confirmation' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => nil)
      testUser.save
      expect(testUser.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should fail when instantiated with mismatched password and confirmation' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "nomatch1234")
      testUser.save
      expect(testUser.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should fail if a user with case insensitive duplicate email is instantiated' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      testUserTwo = User.new(:name => "testy", :email => "testy@TEST.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUserTwo.save
      expect(testUserTwo.errors.full_messages).to include("Email has already been taken")
    end
  end


  describe '.authenticate_with_credentials' do
    
    it 'returns the user when the correct credentials are given' do
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      foundUser = User.authenticate_with_credentials(testUser.email, testUser.password)
      expect(foundUser).to eql(testUser)
    end
    
    
    it 'returns nil when the incorrect email is given' do
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      foundUser = User.authenticate_with_credentials("no@test.com", testUser.password)
      expect(foundUser).to be_nil
    end
    
    it 'returns nil when the incorrect password is given' do
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      foundUser = User.authenticate_with_credentials(testUser.email, "wrongpassword")
      puts "found user is #{foundUser.inspect}"
      expect(foundUser).to be_nil
    end

    it 'returns the user when the correct credentials are given and the email contains whitespace at the beginning or end' do
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      foundUser = User.authenticate_with_credentials("    testy@test.com    ", testUser.password)
      expect(foundUser).to eql(testUser)
    end

    it 'returns the user when the correct credentials are given and the email has the wrong case' do
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin1234", :password_confirmation => "admin1234")
      testUser.save
      foundUser = User.authenticate_with_credentials("tESTy@teST.COm", testUser.password)
      expect(foundUser).to eql(testUser)
    end


  end


end
