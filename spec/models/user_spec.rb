require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should fail when instantiated with no password' do 
      testUser = User.new(:name => "testy", :email => "testy@test.com", :password => "admin", :password_confirmation => nil)
      testUser.save
      puts testUser.errors.full_messages
      expect(testUser).to be_falsey
    end
  end
end
