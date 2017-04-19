require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :body }
  end

  describe 'associations' do
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :likes }
  end
end
