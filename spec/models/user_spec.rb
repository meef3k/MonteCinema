require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'when password is too long' do
      it 'validates password length', :aggregate_failures do
        password = ('m' * 73).to_s
        user = build(:user, password: password)
        expect(user).not_to be_valid
        expect(user.errors).to match_array(['Password Password is too long'])
      end
    end
  end
end
