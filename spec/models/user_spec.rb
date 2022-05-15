require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { described_class.new }

    it "is valid with valid attributes" do
        user.login = "Knyaz_ann"
        user.password = "#jzXG0@w"
        expect(user).to be_valid
    end

    it "is invalid with invalid login" do
        #user.login = "ann"
        user.password = "#jzXG0@w"
        expect(user).to be_invalid
    end

    it "is invalid with invalid password" do
        user.login = "Knyaz_ann"
        #user.password = "111"
        expect(user).to be_invalid
    end

    it { should have_secure_password }


    describe "validations" do
        it{ should validate_presence_of :login }
        #it{ should validate_uniqueness_of :login }

        #it "password length minimum 8" do
            #should validate_length_of(:password).
                #is_at_least(8).
                #on(:create)
        #end
        #it { should_not allow_value("Anna_21").for(:login) }
        #it { should_not allow_value("test").for(:email) }
        #it { should_not allow_value("test@test").for(:email) }
        #it { should allow_value("test@test.ru").for(:email) }
        
    end

    describe "Associations" do
        it{ should have_many(:documents) }
        it{ should have_many(:routes) }
        #it{ should have_many(:participants) }
        it{ should have_many(:goals) }
        it{ should have_many(:tasks) }
        #it{ should have_many(:departments) }
        #it{ should belong_to(:departments) }
    end     

end