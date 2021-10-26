require 'rails_helper'

RSpec.describe User, type: :model do
 context "validation tests" do
   it 'user is validate test ' do
      user = User.new(name: Faker::Name.first_name, email: Faker::Internet.email).save
      expect(user).to eq(true)
    end
    it 'user is not validate test' do
      user = User.new().save
      expect(user).to eq(false)
    end
  end
end
