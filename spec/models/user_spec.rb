# spec for testing users
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    #it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'relationships' do
    it { is_expected.to have_many :posts }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :likes }
    it { is_expected.to have_many :friendships }
    it { is_expected.to have_many :friends }
    it { is_expected.to have_many :friend_requests }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :location }
    it { is_expected.to respond_to :occupation }
    it { is_expected.to respond_to :age }
    it { is_expected.to respond_to :self_summary }
  end

  describe 'associations' do
    it { is_expected.to have_many :posts }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :likes }
    it { is_expected.to have_many :friendships }
    it { is_expected.to have_many :friends }
    it { is_expected.to have_many :friend_requests }
  end

  describe 'devise' do
    skip 'add tests for devise'
  end
end
