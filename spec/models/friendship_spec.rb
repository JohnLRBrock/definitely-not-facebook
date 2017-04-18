# spec for testing friendship relationships between users
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    2.times { create(:user) }
  end
end
