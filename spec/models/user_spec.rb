require 'rails_helper'

RSpec.describe User do
    let(:user) { described_class.new }

    it "is valid with valid attributes" do
        user.login = "qwerty"
        user.password = "qwerty"
        expect(user).to be_valid
    end

    describe "Associations" do
        it { should have_many(:documents) }
      end

      

end