require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'validations' do

    let(:incomplete_user) { User.new(username: '', email:'email@aa.io', password: 'password') }


    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    
    context 'uniqueness' do 
      before(:each) do 
        create(:user)
      end
        it { should validate_uniqueness_of(:username) }
        it { should validate_uniqueness_of(:session_token) }
      end
  end

  describe 'is_password?' do 
    let!(:user) { create(:user)}

    context 'with a valid password' do
      it "should return true" do 
        expect(user.is_password?("password")).to be true
      end
    end

    context "with invalid password" do
      it "should return false" do
        expect(user.is_password?("not_password")).to be false
      end
    end
  end

  describe 'password hashing' do
    it 'does not save password to the database' do 
      create(:user, username: 'zombie')
      user = User.find_by(username: 'zombie')
      expect(user.password).not_to eq('password')
    end
    
    it 'hashes password using BCrypt' do 
      expect(BCrypt::Password).to receive(:create).with('abcdef')
      build(:user, password: 'abcdef')
    end
  end

end




