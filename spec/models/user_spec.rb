require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'when password is too long' do
      let(:password) { ('m' * 73).to_s }
      let(:user) { build(:user, password: password) }
      it 'validates password length', :aggregate_failures do
        expect(user).not_to be_valid
        expect(user.errors).to match_array(['Password is too long'])
      end
    end
  end
end
